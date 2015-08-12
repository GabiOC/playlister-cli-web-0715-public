class LibraryParser
  # code here
  def files
    Dir["db/data/*"]
  end

  def parse_filename(filename)
    regex = /(.+) - (.+) \[(.+)\].mp3/.match(filename)
    regex[1..-1]
  end

  def build_song(artist_name, song_name, genre_name)
    song = Song.create_by_name(song_name)
    artist = Artist.create_by_name(artist_name)
    artist.add_song(song)

    genre = Genre.create_by_name(genre_name)
    genre.add_song(song)

    song
  end

  def call
    base_files = files.map { |file_name|
      file_name.gsub("db/data/", "")
    }
    base_files.each do |file|
      parsed_array = parse_filename(file)
      build_song(*parsed_array)
    end
  end
end
