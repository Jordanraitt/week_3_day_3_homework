require('pg')
require_relative("../db/sql_runner.rb")

class Album

attr_reader :id, :artist_id
attr_accessor :name_title, :genre

  def initialize(options)
    @id = options['id'].to_i()
    @artist_id = options['artist_id'].to_i()
    @name_title = options['name_title']
    @genre = options['genre']
  end

  def save()
    sql = "
    INSERT INTO albums (
      name_title,
      genre
    )
    VALUES ($1, $2)
    RETURNING id;
    "
    values = [@name_title, @genre]

    @id = SqlRunner.run(sql, values)[0]["id"].to_i

  end

end
