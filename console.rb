require_relative('./models/albums.rb')
require_relative('./models/artists.rb')

require("pry")

artist1 = Artist.new({
  "name" => "Kings_of_leon"
  })
artist1.save

album1 = Album.new({
  "artist_id" => artist1.id,
  "name_title" => "Youth_and_Young_Manhood",
  "genre" => "Garage rock/southern rock"
  })
album1.save

binding.pry
nil
