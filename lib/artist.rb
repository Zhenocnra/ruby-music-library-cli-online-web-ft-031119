class Artist
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless song.include?(song)
  end
  
  def genres
    songs.collect{ |s| s.genre }.uniq
  end
end