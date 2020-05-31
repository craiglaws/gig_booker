require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gig')
require_relative('../models/venue')
require_relative('../models/band')
require_relative('bands_controller')
require_relative('venues_controller')
also_reload ('../models/*')


get '/gigs' do
  gigs = Gig.sort_by_date()
  @next_gigs = gigs.first(3)
  @bands = Band.all()
  @venues = Venue.all()
  erb( :"gigs/index")
end

get '/gigs/band' do
  band = Band.find(params['id'].to_i)
  redirect "/bands/#{band.id}"
end

get '/gigs/venue' do
  venue = Venue.find(params['id'].to_i)
  redirect "/venues/#{venue.id}"
end
