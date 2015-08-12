class Genre
  # code here

  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize
    @@all << self
    @songs = []
    @artists = []
  end

  def add_song(song)
    @songs << song
    song.instance_variable_set(:@genre, self)

    if song.artist
      song.artist.genres << self
      
      self.artists << song.artist
      self.artists.uniq!
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
  # genre = genre.new
  # genre.count

  # CLASS
  # genre.count

  # Need 'self' for it to be a class method. Without 'self', it'd be an instance method.

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  # Doesn't conflict with genre's name (i.e. genre.name) because variable you're passing into method takes precedence
  def self.find_by_name(name)
    self.all.find{|genre| genre.name == name}
  end

  def self.create_by_name(name)
    # genre = genre.new
    genre = self.new
    genre.name = name
    genre
  end
end