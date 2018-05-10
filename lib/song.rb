class Song
  attr_accessor :name, :artist
  attr_reader :artist_name

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    @artist_name = artist_name
    artist = Artist.find_or_create_by_name(artist_name)
    artist.self = add_song(self)
  end

  def self.new_by_filename(filename)
    newfile = filename.split(" - ")
    song = Song.new(newfile)
    song.name = newfile[0]
    song.artist_name = newfile[1]
    #binding.pry
  end

end
