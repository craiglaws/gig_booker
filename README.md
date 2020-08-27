RUBY PROJECT - G IN THE PARK

SETUP

-- In terminal access the project folder

-- Create database  'g_in_the_park'

-- Drop tables in database  'psql -d g_in_the_park -f db/gigs.sql'

-- Populate database with seeds file  'ruby db/seeds.rb'

-- Launch main app file  'ruby app.rb'



USING THE APP

-- Once setup is complete launch a internet browser 'localhost:4567/'
-- The homapage has links to the three main pages; bands, venues and gigs


BANDS

-- The bands homepage will list all bands saved in the database
-- Click on a band name to take you to their page that shows more information on them, from this page click the edit button if you wish to edit or delete
-- From the bands homepage you can click the ADD BAND button which will take you to a form submission
-- Fill out the form with relevant data, click add band and it will be added to the database



VENEUES

-- The venues homepage will list all venues saved in the database
-- Click on a venue name to take you a page that shows all gigs at this venue, from this page click the edit button if you wish to edit or delete
-- From the venues homepage you can click the ADD VENUE button which will take you to a form submission
-- Fill out the form with relevant data, click add venue and it will be added to the database



GIGS

-- The gigs homepage shows a list of the next 3 gigs and buttons to search gigs by venue or artsit, see all gigs & create new gig
-- The search gigs by band/venue gives a drop down menu with all band/venue names in database; clicking will direct to unique band/venue page
-- See all gigs will show all gigs in database in date order with past gigs being scored out
-- Create new gig will take you to a form submission, choose from band & venue (must already be saved in database) adn date & time





BRIEF

Glasgow City Council have asked for a booking system for thier live summer music bookings across the parks of Glasgow. They want a piece of software that can manage bands & venues information & be able to create new bookings(gigs) with these bands & venues.


MVP

-- Allow the user to create, edit and delete bands & venues
-- To create gigs by assigning a band & venue with a date & time
-- Allow the user to view bookings for each band
-- ALlow the user to view bookings at each venue
-- Allow the user to view all gigs in date order

EXTENSIONS

-- Have logos for each band and venue
-- Use date functions to show gigs that have past or to be played
-- Add a ticket buying function that references the capacity of the venue



TECHNOLOGIES USED

-- Ruby
-- PostGres
-- Sinatra
-- Atom Text Editor
