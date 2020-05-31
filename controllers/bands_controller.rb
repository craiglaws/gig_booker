require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/band')
also_reload ('../models/*')



get '/bands' do
  @bands = Band.all()
  erb(:"bands/index")
end

get '/bands/new' do
  erb(:"bands/new")
end


get '/bands/:id' do
  @band = Band.find(params['id'].to_i)
  erb (:"bands/show")
end

post '/bands' do
  band = Band.new(params)
  band.save()
  redirect '/bands'
end

get '/bands/:id/edit' do
  @band = Band.find(params['id'].to_i)
  erb (:"bands/edit")
end

post '/bands/:id/delete' do
  band = Band.find(params['id'].to_i)
  band.delete()
  redirect '/bands'
end

post '/bands/:id' do
  band = Band.new(params)
  band.update()
  redirect "/bands/#{params[:id]}"
end
