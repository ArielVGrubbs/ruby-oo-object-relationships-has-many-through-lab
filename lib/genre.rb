require_relative './song.rb'
require_relative './artist.rb'

class Genre
    attr_accessor :name
    @@all = []
    def initialize (name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |songs|
            songs.genre == self
        end
    end

    def artists
        artists = []
        self.songs.each do |song|
            artists << song.artist
        end
        return artists
    end

    def self.all
        @@all
    end
end