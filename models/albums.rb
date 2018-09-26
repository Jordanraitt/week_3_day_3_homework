require('pg')
require_relative("../db/sql_runner.rb")

class Album

attr_reader(:id, :artist_id)
attr_accessor(:name_title, :genre)

  def initialize(options)
    @id = options['id'].to_i()
    @artist_id = options['artist_id'].to_i()
    @name_title = options['name_title']
    @genre = options['genre']
  end

  def save()
    sql = "
    INSERT INTO albums (
      artist_id,
      name_title,
      genre
    )
    VALUES ($1, $2, $3)
    RETURNING id;
    "
    values = [
      @artist_id,
      @name_title,
      @genre
    ]

    @id = SqlRunner.run(sql, values)[0]["id"].to_i

  end

  def self.all()
    sql = 'SELECT * FROM albums;'

    order_hashes = SqlRunner.run(sql)

    order_objects = order_hashes.map {|order_hash| Album.new(order_hash)}

    return order_objects
  end

  def self.delete_all
      sql = "DELETE FROM albums;"
      SqlRunner.run(sql)
    end

    def artist
        sql = "SELECT * FROM artists
        WHERE id = $1"

        result = SqlRunner.run(sql, [@artist_id])
        artist_hash = result[0]
        artist = Artist.new(artist_hash)

        return artist
      end
end
