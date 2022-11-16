#!/usr/bin/env ruby
# frozen_string_literal: true

require 'httparty'
require 'wunderlist'

user = 'frbl' # username$1
gist = 'c9f00eac1512278d67861ce327ce5a66' # Gist$2

# Wunderlist access token and ID
wl_access_token = ''
wl_client_id = ''

list_name = 'Groceries'

wl = Wunderlist::API.new(
  access_token: wl_access_token,
  client_id: wl_client_id
)

mapping = {}
Thread.new do
  loop do
    mapping = {}
    random = Random.rand(9999)
    url = "https://gist.githubusercontent.com/#{user}/#{gist}/raw?#{random}"

    res = HTTParty.get(
      url,
      headers: {
        'User-Agent' => 'Awesome-Octocat-App'
      }
    )

    yml = YAML.safe_load(res)

    yml.each_key do |product|
      yml[product].each do |code|
        code = code.to_s
        mapping[code] = product
      end
    end

    sleep(30)
  end
end

while code = gets
  code = code.gsub("\n", '')

  product = mapping[code]
  puts "Product #{code} corresponds to #{product}"

  task = wl.new_task(list_name, title: product, completed: false)
  task.save
end
