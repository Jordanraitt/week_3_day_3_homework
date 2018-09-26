require_relative('./models/albums.rb')
require_relative('./models/artists.rb')

require("pry")

Album.delete_all
Artist.delete_all

artist_1 = Artist.new({
  "name" => "Kings_of_leon"
  })

artist_1.save

artists = Artist.all

album_1 = Album.new({
  "artist_id" => artist_1.id,
  "name_title" => "Youth_and_Young_Manhood",
  "genre" => "Garage rock/southern rock"
  })

album_1.save

albums = Album.all

binding.pry
nil
