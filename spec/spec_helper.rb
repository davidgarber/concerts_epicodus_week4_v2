ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('capybara/rspec')
require('rspec')
require('band')
require('venue')
require('pry')
require('pg')

RSpec.configure do |config|
  config.after(:each) do
    Band.all().each do |band|
      band.destroy()
    end
    Venue.all().each do |venue|
      venue.destroy()
    end
  end
end
