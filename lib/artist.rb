require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    @songs << song
    binding.pry
  end
  
  def self.find_or_create_by_name(name)
    self.create(name) unless self.all.find{|artist| artist.name == name}
  end
  
  def self.create(name)
    self.new(name).tap{|artist| artist.save}
  end
  
  def print_songs
    @songs.each{|song| puts song.name}
  end
  
end