## __GIG BOOKER__


#### __SETUP__

* In terminal access the project folder

* Create database 'g_in_the_park'

* Drop tables in database 'psql -d g_in_the_park -f db/gigs.sql'

* Populate database with seeds file 'ruby db/seeds.rb'

* Launch main app file 'ruby app.rb'

#### __USING THE APP__

* Once setup is complete launch a internet browser 'localhost:4567/'

* The homapage has links to the three main pages; bands, venues and gigs

###### __BANDS__

* The bands homepage will list all bands saved in the database

* Click on a band name to take you to their page that shows more information on them, from this page click the edit button if you wish to edit or delete

* From the bands homepage you can click the ADD BAND button which will take you to a form submission

* Fill out the form with relevant data, click add band and it will be added to the database

###### __VENEUES__

* The venues homepage will list all venues saved in the database

* Click on a venue name to take you a page that shows all gigs at this venue, from this page click the edit button if you wish to edit or delete

* From the venues homepage you can click the ADD VENUE button which will take you to a form submission

* Fill out the form with relevant data, click add venue and it will be added to the database

###### __GIGS__

* The gigs homepage shows a list of the next 3 gigs and buttons to search gigs by venue or artsit, see all gigs & create new gig

* The search gigs by band/venue gives a drop down menu with all band/venue names in database; clicking will direct to unique band/venue page

* See all gigs will show all gigs in database in date order with past gigs being scored out

* Create new gig will take you to a form submission, choose from band & venue (must already be saved in database) adn date & time

###### __TECHNOLOGIES USED__

* Ruby
* PostGres
* Sinatra
* Atom Text Editor
