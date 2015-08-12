# Song
# belongs_to :artist
# belongs_to :genre

# Artist
# has_many :



class Song
  # code here

  ## Error message if attributes not added to attr_accessor (i.e. ':genre' missing)
  #  NoMethodError: undefined method `genre=' for #<Song:0x007fc0448a46f0>
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  # INSTANCE
  # song = Song.new
  # song.count

  # CLASS
  # Song.count

  # Need 'self' for it to be a class method. Without 'self', it'd be an instance method.

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  # Doesn't conflict with Song's name (i.e. Song.name) because variable you're passing into method takes precedence
  def self.find_by_name(name)
    self.all.find{ |song| song.name == name }
  end

  def self.create_by_name(name)
    # song = self.new
    song = Song.new
    song.name = name
    song
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def genre=(genre)
    genre.add_song(self)
  end

  def artist=(artist)
    artist.add_song(self)
  end
end