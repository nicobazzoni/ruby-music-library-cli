class MusicLibraryController
    attr_accessor :path, :song, :artist, :genre, :musiclibrarycontroller
    def initialize(path ='./db/mp3s')
      @path = path
      MusicImporter.new(path).import
    end

    def files
        Dir[File.join(@path, '*.mp3')].map do |file|
          File.basename file
        end
    end

      def import 
        files.each { |file| Song.create_from_filename(file) }
      end

      def call 
        input = gets.strip

     if input != exit

     puts "Welcome to your music library!"
      end
    end
end