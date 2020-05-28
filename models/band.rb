require_relative('../db/sql_runner')

class Band


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @about = options['about']
  end

  






end
