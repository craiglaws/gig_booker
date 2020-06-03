require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gig')
require_relative('../models/venue')
require_relative('../models/band')
also_reload ('../models/*')


get '/gigs' do

  @next_gigs = Gig.next_three()
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

get '/gigs/show' do
  @gigs = Gig.sort_by_date()
  @bands = Band.all()
  @venues = Venue.all()
  erb( :"gigs/show")
end

 get '/gigs/new' do
   @bands = Band.all
   @venues = Venue.all
   erb( :"gigs/new")
 end

post '/gigs' do
  gig = Gig.new(params)
  gig.save()
  redirect ('/gigs')
end
