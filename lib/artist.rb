class Artist
    attr_accessor :name, :artist, :genre, :songs 
    extend Concerns::Findable
    def initialize(name)
        @name = name
        @songs= []
    end

    @@all = []

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end
    
    def genres
        @new_array = []
        @songs.each do |song|
      if @new_array.include?(song.genre)
        nil
      else
        @new_array << song.genre
      end
    end
    @new_array
    end
    
    def save
        @@all <<self
    end

    def self.create(name)
        instance = Artist.new(name)
        instance.save
        instance
      end
      
      def add_song(song)
        song.artist = self if song.artist == nil 
        self.songs << song if self.songs.include?(song) == false
      end
end