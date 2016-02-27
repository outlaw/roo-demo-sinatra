require 'rubygems'
require 'bundler'

Bundler.require

require 'dotenv'
Dotenv.load('.env', ".env.#{ENV['RACK_ENV']}")

require './app.rb'
run Sinatra::Application
