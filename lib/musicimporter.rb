class MusicImporter 
    
        attr_accessor :path
        
        def initialize(path)
        @path = path
        @filenames = []
        end
    
        def files 
            Dir.entries(path).each do |filename|
            @filenames << "#{filename}"
            end
            @filenames.delete_if {|x| x == "." || x == ".."}  
        end
    
        def import
            files.each {|song| Song.create_from_filename(song)}
        end
            
            
         
    
    end