require_relative('../db/sql_runner')

class Gig

  attr_reader :id
  attr_accessor  :band_id, :venue_id, :date, :time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @band_id = options['band_id'].to_i
    @venue_id = options['venue_id'].to_i
    @date = options['date']
    @time = options['time']
  end

  def save()
    sql = "INSERT INTO gigs (
            band_id,
            venue_id,
            date,
            time)
            VALUES (
              $1, $2, $3, $4)
              RETURNING id"

    values = [@band_id, @venue_id, @date, @time]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE gigs SET (
            band_id,
            venue_id,
            date,
            time)
            = (
              $1, $2, $3, $4
              )
              WHERE id = $5"
    values = [@band_id, @venue_id, @date, @time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM gigs WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def band()
    sql = "SELECT * FROM bands WHERE bands.id = $1"
    values = [@band_id]
    pg_result = SqlRunner.run(sql, values).first
    return Band.new(pg_result)
  end

  def venue()
    sql = "SELECT * FROM venues WHERE venues.id = $1"
    values = [@venue_id]
    pg_result = SqlRunner.run(sql, values).first
    return Venue.new(pg_result)
  end

  def self.all()
    sql = "SELECT * FROM gigs"
    pg_result = SqlRunner.run(sql)
    gigs = pg_result.map {|gig| Gig.new(gig)}
    return gigs
  end

  def self.delete_all()
    sql = "DELETE FROM gigs"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM gigs WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run(sql, values).first
    gig = Gig.new(pg_result)
    return gig
  end

  def self.sort_by_date()
    sql = "SELECT * FROM gigs ORDER BY date, time ASC"
    pg_result = SqlRunner.run(sql)
    gigs = pg_result.map {|gig| Gig.new(gig)}
    return gigs
  end

end
