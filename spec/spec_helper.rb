require 'turnip'
require 'turnip/rspec'
require 'uri'
require 'net/http'
require 'openssl'

Dir.glob('spec/steps/*steps.rb') { |file| load file, true }

module Utility
  def self.params_to_query params
    params.reject do |key, value|
      value.nil?
    end.map do |key,value|
      "#{URI.encode_www_form_component(key.to_s)}=#{URI.encode_www_form_component(value.to_s)}"
    end.join('&')
  end
end
