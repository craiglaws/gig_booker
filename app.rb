require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/bands_controller')
require_relative('controllers/venues_controller')
require_relative('controllers/gigs_controller')


get '/' do
  @bands = Band.all()
  @venues = Venue.all()
  @gigs = Gig.all()
  erb (:index)
end
