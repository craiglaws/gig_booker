require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/venue')
also_reload ('../models/*')
require('pry-byebug')


get '/venues' do
  @venues = Venue.all()
  erb (:"venues/index")
end

get '/venues/new' do
  erb (:"venues/new")
end

get '/venues/:id' do
  @venue = Venue.find(params['id'].to_i)
  @gigs = @venue.arrange_gigs()
  erb (:"venues/show")
end

get '/venues/:id/edit' do
  @venue = Venue.find(params['id'].to_i)
  erb (:"venues/edit")
end

post '/venues' do
  venue = Venue.new(params)
  venue.save()
  redirect '/venues'
end

post '/venues/:id' do
  venue = Venue.new(params)
  venue.update()
  redirect '/venues'
end

post '/venues/:id/delete' do
  venue = Venue.find(params['id'].to_i)
  venue.delete()
  redirect '/venues'
end
