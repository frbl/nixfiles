#!/usr/bin/env ruby
# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require 'uri'

url = ARGV[0]
if url.nil? || url == ''
  puts 'Run as follows: wikipedia <url of the article>'
  exit 1
end

dir = ENV['MENDELEY_BLACKHOLE']
if dir.nil? || dir == ''
  puts 'Please set the MENDELEY_BLACKHOLE env variable!'
  exit 1
end

# Grab the base url
uri = URI.parse(url)
base = "#{uri.scheme}://#{uri.host}"

filename = "#{dir}#{url.gsub(base, '').gsub('/', '-').gsub('(', '').gsub(')', '')[1..-1]}.pdf"

# Get the pdf link from the content page
res = HTTParty.get(url)
page = Nokogiri::HTML(res)
pdf_url = page.css('#coll-download-as-rdf2latex').children
pdf_url = pdf_url.select { |x| x.name == 'a' }.first.attributes['href'].value

puts "Getting next url: #{pdf_url}"

# Download the actual pdf
res = HTTParty.get(base + pdf_url)
page = Nokogiri::HTML(res)
page = page.css('#mw-content-text').children
pdf_url = page.css('.external').css('a').select { |x| x.children.first.text == 'Download the file' }.first.attributes['href'].value
puts "Downloading #{pdf_url}"
`wget -O "#{filename}" "#{pdf_url}"`

puts 'Downloaded'
