class Artist
  @@all = []
  attr_accessor :name, :song

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    return @@all    
  end
  
  def songs
    return @songs
    #Song.find_by_artist(self)
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    return @@all.find {|artist| artist.name == name }
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    return artist
    #self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
  def add_song(song)
    @songs << song
  end
end