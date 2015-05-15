ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('capybara/rspec')
require('rspec')
require('band')
require('venue')
require('pry')
require('pg')
