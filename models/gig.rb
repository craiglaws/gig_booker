require_relative('../db/sql_runner')

class Gig

  attr_reader :id, :band_id, :venue_id, :date, :time

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
    sql = "DELETE DROM gigs WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM gigs"
    pg_result = SqlRunner.run(sql)
    gigs = pg_result.map {|gig| Gig.new(gig)}
    return gigs
  end

  def self.delete_all()
    sql = "DELETE * FROM gigs"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM gigs WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run(sql, values).first
    gig = Gig.new(pg_result)
    return gig
  end

end 
