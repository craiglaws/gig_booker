require_relative('../db/sql_runner')

class Band

  attr_reader :id, :name, :genre, :about

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @about = options['about']
  end

  def save()
    sql = "INSERT INTO bands (
      name,
      genre,
      about
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"

    values = [@name, @genre, @about]
    pg_result = SqlRunner.run(sql, values)
    @id = pg_result[0]['id'].to_i

  end


  def update()
    sql = "UPDATE bands SET (
            name,
            genre,
            about)
            = (
              $1, $2, $3)
              WHERE id = $4"
    values = [@name, @genre, @about, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bands WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bands"
    pg_result = SqlRunner.run(sql)
    bands = pg_result.map {|band| Band.new(band)}
    return bands
  end

  def self.delete_all()
    sql = "DELETE * FROM bands"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM bands WHERE id = $1"
    values = [id]
    pg_result = SqlRunner.run(sql, values).first
    band = Band.new(pg_result)
    return band
  end 





end
