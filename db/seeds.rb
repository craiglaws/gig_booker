require_relative('../models/band')
require_relative('../models/venue')
require_relative('../models/gig')
require('pry-byebug')

Gig.delete_all()
Venue.delete_all()
Band.delete_all()


band1 = Band.new({
  "name" => "The Fratellis",
  "genre" => "Indie",
  "bio" => "The Fratellis are a Scottish rock band from Glasgow, formed in 2005. The band consists of lead vocalist and guitarist Jon Fratelli, bassist and backing vocalist Barry Fratelli, and drummer and backing vocalist Mince Fratelli. Their singles 'Chelsea Dagger' and 'Whistle for the Choir' were both top ten hits in the UK charts."
  })
  band1.save()

band2 = Band.new({
  "name" => "The Proclaimers",
  "genre" => "Folk",
  "bio" => "Strikingly individual, twin brothers Craig and Charlie Reid emerged 31 years ago with their debut album This Is The Story and Top 3 single ‘Letter from America’. Since then their enduring appeal across generations has have over the years seen them enjoy huge success across the globe"
  })
  band2.save()

band3 = Band.new({
  "name" => "Biffy Clyro",
  "genre" => "Rock",
  "bio" => "Biffy Clyro are a Scottish rock band that formed in Kilmarnock, East Ayrshire, composed of Simon Neil (guitar, lead vocals), James Johnston (bass, vocals), and Ben Johnston (drums, vocals). Currently signed to 14th Floor Records, they have released eight studio albums, four of which (Puzzle, Only Revolutions, Opposites, and Ellipsis) reached the top five in the UK Albums Chart, with their sixth studio album, Opposites claiming their first UK No. 1 album."
  })
  band3.save

venue1 = Venue.new({
  "name" => "Alexandra Park",
  "location" => "Dennistoun",
  "capacity" => 175
  })
  venue1.save

venue2 = Venue.new({
  "name" => "Kelvingrove Park",
  "location" => "Kelvingrove",
  "capacity" => 400
  })
  venue2.save

venue3 = Venue.new({
  "name" => "Glasgow Green",
  "location" => "Trongate",
  "capacity" => 950
  })
  venue3.save


gig1 = Gig.new({
  "band_id" => band1.id,
  "venue_id" => venue1.id,
  "date" => "06/14/2020",
  "time" => "17:00"
  })
  gig1.save

gig2 = Gig.new({
  "band_id" => band1.id,
  "venue_id" => venue2.id,
  "date" => "06/19/2020",
  "time" => "15:00"
  })
  gig2.save

gig3 = Gig.new({
  "band_id" => band1.id,
  "venue_id" => venue3.id,
  "date" => "06/27/2020",
  "time" => "12:00"
  })
  gig3.save

gig4 = Gig.new({
  "band_id" => band2.id,
  "venue_id" => venue1.id,
  "date" => "06/19/2020",
  "time" => "16:00"
  })
  gig4.save

gig5 = Gig.new({
  "band_id" => band2.id,
  "venue_id" => venue2.id,
  "date" => "07/02/2020",
  "time" => "15:30"
  })
  gig5.save

gig6 = Gig.new({
  "band_id" => band2.id,
  "venue_id" => venue2.id,
  "date" => "07/05/2020",
  "time" => "13:30"
  })
  gig6.save

gig7 = Gig.new({
  "band_id" => band3.id,
  "venue_id" => venue1.id,
  "date" => "07/01/2020",
  "time" => "17:00"
  })
  gig7.save

  binding.pry
  nil
