#!/bin/bash
appname=testapp
install_dependencies=false
rails new $appname --minimal --api-only --database postgresql
cd $appname


#########################
# General dependencies  #
#########################

if [ "$install_dependencies" = true ]; then
  # REST connections
  bundle add --skip-install  'httparty'

  bundle add --skip-install  'active_interaction'
  bundle add --skip-install  'jsonapi-serializer' # faster json serializer, netflix approach

  # Enable cross origin requests
  bundle add --skip-install  'rack-cors'

  # Reduces boot times through caching; required in config/boot.rb
  bundle add --skip-install  'bootsnap'

  # Validation of JWT tokens
  bundle add --skip-install  'jwt'

  # .env files
  bundle add --skip-install  'dotenv-rails'

  bundle add --skip-install  'rswag'
  bundle add --skip-install  'rswag-api'
  bundle add --skip-install  'rswag-ui'

  # Delayed job for delayed calculation
  bundle add --skip-install  'delayed_job_active_record'

  # Data migrations
  bundle add --skip-install 'after_party'

  # Logging / monitoring
  bundle add --skip-install 'appsignal'
  bundle add --skip-install 'silencer'
  bundle add --skip-install 'lograge'
  bundle add --skip-install 'remote_syslog_logger'
  bundle add --skip-install 'snitcher'

  # Feature flags
  bundle add --skip-install 'unleash' --version '>= 3.2.1'

  ######################
  # Test / develop dependencies  #
  ######################
  bundle add --group='development, test' --skip-install byebug
  bundle add --group='development, test' --skip-install yard
  bundle add --group='development, test' --skip-install guard-rspec
  bundle add --group='development, test' --skip-install rspec_junit_formatter
  bundle add --group='development, test' --skip-install rspec-rails
  bundle add --group='development, test' --skip-install rswag-specs


  ######################
  # Test dependencies  #
  ######################
  # Code quality monitoring
  # When updating these, also update the gitlabci file
  bundle add --skip-install --group='test' 'rubocop' --version '~> 0.90.0'
  bundle add --skip-install --group='test' 'rubocop-performance' --version '~> 1.6.1'
  bundle add --skip-install --group='test' 'rubocop-rails' --version '~> 2.6.0'
  bundle add --skip-install --group='test' 'rubocop-rspec' --version '~> 1.40.0'

  # Code coverage
  bundle add --skip-install --group='test' 'simplecov'

  # Used for gem mocking
  bundle add --skip-install --group='test' 'factory_bot_rails'

  # Allows jumping back and forth in time
  bundle add --skip-install --group='test' 'timecop'

  # Cleans the database after specs
  bundle add --skip-install --group='test' 'database_cleaner'
  bundle add --skip-install --group='test' 'database_cleaner-active_record'

  ############################
  # Production dependencies  #
  ############################
  # Required by Delayed Job
  bundle add --skip-install --group='production' 'daemons'

  bundle install
fi


echo '{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json"
}' > renovate.json

echo '
FROM alpine:3.13.0 as development
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN apk update --no-cache && apk upgrade --no-cache && apk add --no-cache \
  # Install the latest version of Ruby (needed to run rails)
  ruby \
  # Install the latest version of Bundler (needed to install dependencies)
	ruby-bundler \
  # TODO: Discuss whether this is acutally needed
	ruby-bigdecimal \
  # TODO: Discuss whether this is acutally needed
	ruby-json \
  # Postgress bindings
	libpq \
  # Library and CLI tools for XZ and LZMA compressed files (development files)
	xz-dev

# Set the current working directory to /app
WORKDIR /app

# Copy both the gemfile and gemfile.lock here
COPY Gemfil* ./

# Build dependencies to compile nokogiri
RUN set -x \
	&& apk upgrade --no-cache \
  # Store eveything in a virtual space so it can be removed easily later
	&& apk add --no-cache --virtual build-dependencies \
	build-base libxml2-dev libxslt-dev ruby-dev postgresql-dev \
  # These are needed for neo4r, a dependency of puma
  linux-headers \
  # Install the dependencies for the rails application
	&& bundle install \
  # Remove cache and clean up
	&& rm -rf /usr/local/bundle/bundler/gems/*/.git /usr/local/bundle/cache/ \
	&& apk del build-dependencies

# Copy everything else to the folder
COPY . .

ENTRYPOINT ["/app/bin/docker-entrypoint"]
CMD ["bundle", "exec", "rails","server","-b","0.0.0.0","-p","3000"]
' > Dockerfile

echo "
version: '3.5'

x-rails: &rails
  # Note that this name should be the same as the CI_PROJECT_NAME
  image: $appname
  build:
    target: development
    context: .
  volumes:
    - .:/app:delegated
    - gems_volume:/usr/local/bundle/ruby/2.6.0
    - /app/tmp
  # For some reason without this it wont load the env vars
  env_file:
    - .env

services:
  db:
    image: postgres:10.5 # Check that this is the same as the elephant sql version
    volumes:
      - ./tmp/db:/var/lib/postgresql/data:delegated
    # Sometimes it's easier to test a query with pgAdmin
    ports:
      - "5432:5432"

  web:
    <<: *rails
    # On docker attach web, you can now do byebug using the next two entries
    tty: true
    stdin_open: true
    depends_on:
      - db
    ports:
      - "3000:3000"
      # For rubymine debugging
      - "1234:1234"

  worker:
    <<: *rails
    # On docker attach worker, you can now do byebug using the next two entries
    entrypoint: ["/app/bin/docker-worker-entrypoint.sh"]
    command: ['rake', 'jobs:work']
    restart: on-failure
#    environment:
#      - POSTGRES_USERNAME=postgres
#      - POSTGRES_PASSWORD=postgres
    depends_on:
      - web
      - db

volumes:
  storage_volume:
  gems_volume:
" > docker-compose.yml
