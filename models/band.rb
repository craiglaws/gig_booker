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






end
