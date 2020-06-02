require_relative('../db/sql_runner')

class Band

  attr_reader :id
  attr_accessor :name, :genre, :bio

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @bio = options['bio']
  end

  def save()


    sql = "INSERT INTO bands (
      name,
      genre,
      bio
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"

    values = [@name, @genre, @bio]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result[0]['id'].to_i

  end


  def update()
    sql = "UPDATE bands SET (
            name,
            genre,
            bio)
            = (
              $1, $2, $3)
              WHERE id = $4"
    values = [@name, @genre, @bio, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bands WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def venues()
    sql = "SELECT * FROM venues INNER JOIN gigs ON gigs.venue_id = venues.id WHERE gigs.band_id = $1"
    values = [@id]
    pg_result = SqlRunner.run(sql, values)
    venues = pg_result.map {|venue| Venue.new(venue)}
    return venues
  end

  def gigs()
    sql = "SELECT * FROM gigs WHERE gigs.band_id = $1"
    values = [@id]
    pg_result = SqlRunner.run(sql, values)
    gigs = pg_result.map {|gig| Gig.new(gig)}
    return gigs
  end

  def self.all()
    sql = "SELECT * FROM bands"
    pg_result = SqlRunner.run(sql)
    bands = pg_result.map {|band| Band.new(band)}
    return bands
  end

  def self.delete_all()
    sql = "DELETE FROM bands"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM bands WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run(sql, values).first
    band = Band.new(pg_result)
    return band
  end

  def sort_gigs()
    sql = "SELECT * FROM gigs WHERE gigs.band_id = $1 ORDER BY date, time ASC"
    values = [@id]
    pg_result = SqlRunner.run(sql, values)
    gigs = pg_result.map {|gig| Gig.new(gig)}
    return gigs
  end

end
