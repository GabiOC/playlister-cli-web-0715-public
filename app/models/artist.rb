class Artist
  # code here

  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize
    @@all << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    @songs << song
    song.instance_variable_set(:@artist, self)

    if song.genre
      song.genre.artists << self
      song.genre.artists.uniq!

      self.genres << song.genre
    end
    song
  end

  def add_songs(songs_array)
    songs_array.each { |song| add_song(song) }
  end

  def self.all
    @@all
  end

  # INSTANCE
  # artist = artist.new
  # artist.count

  # CLASS
  # artist.count

  # Need 'self' for it to be a class method. Without 'self', it'd be an instance method.

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  # Doesn't conflict with artist's name (i.e. artist.name) because variable you're passing into method takes precedence
  def self.find_by_name(name)
    self.all.find{|artist| artist.name == name}
  end

  def self.create_by_name(name)
    # artist = Artist.new
    artist = self.new
    artist.name = name
    artist
  end
end