require_relative('../db/sql_runner')

class Venue

  attr_reader :id, :name, :location, :capacity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
    @capacity = options['capacity'].to_i
  end

  def save()
    sql = "INSERT INTO venues (
            name,
            location,
            capacity)
            VALUES (
              $1, $2, $3)
              RETURNING id"

    values = [@name, @location, @capacity, @id]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE venues SET (
            name,
            location,
            capacity)
              = (
                $1, $2, $3)
                  WHERE id = $4"
    values = [@name, @location, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM venues WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def bands()
    sql = "SELECT * FROM bands INNER JOIN gigs ON gigs.band_id = bands.id WHERE bands.id = $1"
    values = [@id]
    pg_result = SqlRunner.run(sql, values)
    bands = pg_result.map {|band| Band.new(band)}
    return bands
  end

  def bookings()
    sql = "SELECT * FROM gigs WHERE gigs.venue_id = $1"
    values = [@id]
    pg_result = SqlRunner.run(sql, values)
    gigs = pg_result.map {|gig| Gig.new(gig)}
    return gigs
  end


  def self.all()
    sql = "SELECT * FROM venues"
    pg_result = SqlRunner.run(sql)
    venues = pg_result.map {|venue| Venue.new(venue)}
    return venues
  end

  def self.delete_all()
    sql = "DELETE * FROM venues"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM venues WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run(sql, values).first
    venue = Venue.new(pg_result)
    return venue
  end



end
