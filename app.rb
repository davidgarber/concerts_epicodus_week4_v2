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
  @bands = Band.all()
  name = params.fetch("name")
  @new_band = Band.new({:name => name})
  if @new_band.save()
    erb(:band_list)
  else
    erb(:errors_band)
  end
end

get('/band/:id') do
  @band = Band.find(params.fetch("id"))
  erb(:band_detail)
end

# post('/add_venue/:id') do
#   @name = params.fetch("name")
#   @band_id = params.fetch("id")
#   @band = Band.find(@band_id)
#   add_venue = Venue.new({:name => @name, :band_ids => @band_id})
#   @band.venues.push(add_venue)
#   erb(:band_detail)
# end

patch('/add_venue/:id') do
  @name = params.fetch("name")
  @band_id = params.fetch("id")
  @band = Band.find(@band_id)
  add_venue = Venue.new({:name => @name, :band_ids => @band_id})
  @band.venues.push(add_venue)
  erb(:band_detail)
end

get('/venues') do
  @venues = Venue.all()
  erb(:venue_list)
end

post('/add_venue') do
  @venues = Venue.all()
  name = params.fetch("name")
  @new_venue = Venue.new({:name => name})
  if @new_venue.save()
    erb(:venue_list)
  else
    erb(:errors_venue)
  end
end

get('/venue/:id') do
  @venue = Venue.find(params.fetch("id"))
  erb(:venue_detail)
end

patch('/band/:id') do
  new_name = params.fetch('new_name')
  @band = Band.find(params.fetch('id').to_i())
  @band.update({:name => new_name})
  new_name = params.fetch('new_name')
  erb(:band_detail)
end

delete('/band/:id') do
  id = params.fetch("id")
  @band = Band.find(id)
  @band.destroy()
  @bands = Band.all()
  erb(:band_list)
end

post('/add_band/:id') do
  @name = params.fetch("name")
  @venue_id = params.fetch("id")
  @venue = Venue.find(@venue_id)
  update_band = Band.new({:name => @name, :venue_ids => @venue_id})
  @venue.bands.push(update_band)
  erb(:venue_detail)
end

delete('/venue/:id') do
  id = params.fetch("id")
  @venue = Venue.find(id)
  @venue.destroy()
  @venues = Venue.all()
  erb(:venue_list)
end
