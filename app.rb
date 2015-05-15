require('sinatra')
require('sinatra/activerecord')
require('sinatra/reloader')
also_reload('lib/*.rb')
require('./lib/band')
require('./lib/venue')
require('pg')
require('pry')

get('/') do
  erb(:index)
end

get('/bands') do
  @bands = Band.all()
  erb(:band_list)
end

post('/add_band') do
  name = params.fetch("name")
  Band.create({:name => name})
  @bands = Band.all()
  erb(:band_list)
end

get('/band/:id') do
  @band = Band.find(params.fetch("id"))
  erb(:band_detail)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venue_list)
end

post('/add_venue') do
  name = params.fetch("name")
  Venue.create({:name => name})
  @venues = Venue.all()
  erb(:venue_list)
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id"))
  erb(:venue_detail)
end
