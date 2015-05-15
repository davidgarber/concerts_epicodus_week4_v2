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
