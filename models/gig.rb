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

    if check_date_band() == 0
      if check_date_venue() == 0
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
      end
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

    def check_date_band()
      sql = "SELECT * FROM gigs WHERE band_id = $1 AND date = $2"
      values = [@band_id, @date]
      pg_result = SqlRunner.run(sql, values).count
      return pg_result
    end

    def check_date_venue()
      sql = "SELECT * FROM gigs WHERE venue_id = $1 AND date = $2"
      values = [@venue_id, @date]
      pg_result = SqlRunner.run(sql, values).count
      return pg_result
    end

    def is_past()
      gig_date = Date.parse(@date)
      date_now = Date.today()
      return gig_date < date_now
    end

    def self.next_gigs()
      gigs = self.sort_by_date()
      next_gigs = []
      for gig in gigs
        if gig.is_past == false
          next_gigs.push(gig)
        end
      end
      return next_gigs
    end




  end
