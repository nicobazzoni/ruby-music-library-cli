require 'pry'
class Song
    attr_accessor :name, :artist, :genre, :musicimporter, :musiclibrarycontroller
    extend Concerns::Findable
    @@count = 0
    @@genres = []
    @@artists = []

 
    @@all = []
    
    def initialize(name, artist = nil, genre = nil) 
        # binding.pry
      @name = name
       self.artist = (artist) if artist 
       self.genre = (genre) if genre 
    
   
    end

  


    def self.all
        @@all 
    end
    
    def self.count
        @@count
      end
     
      def self.destroy_all 
        @@all.clear
      end

      def save
      @@all << self 
      end
      
      def artist
        @artist
        end
    
        def artist=(artist)
            @artist = artist
            artist.add_song(self)
        end
      
        def genre
        @genre 
        end

        def genre=(genre)
            @genre = genre
            genre.songs << self unless genre.songs.include?(self)
          end
           
          def self.new_from_filename(filename)
            array = filename.split(" - ")

            song_name = array[1]
            artist_name = array[0]
            genre_name = array[2].split(".mp3").join

            artist = Artist.find_or_create_by_name(artist_name)
            genre = Genre.find_or_create_by_name(genre_name)
            self.new(song_name, artist, genre)
          end

          def self.create_from_filename(filename)
            self.new_from_filename(filename).save
          end
        
      
      def self.artists
        @@artists.uniq!
      end

      def self.create(name)
        instance = Song.new(name)
        instance.save
        instance
      end
      
      def self.genres
        @@genres.uniq!
      end
      
        def self.genre_count
        
        @@genres.each do |genre|
        @@genre_count[genre] = @@genres.count(genre)
        end
        @@genre_count
        end
      
      def self.artist_count
        @@artists.each do |artist|
          @@artist_count[artist] = @@artists.count(artist)
      end
      @@artist_count
    end

end
