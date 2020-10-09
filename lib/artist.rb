require_relative './song.rb'
require_relative './genre.rb'
require 'pry'
# require_relative './lib/meal.rb'
# require_relative './lib/waiter.rb' 


class Artist
    attr_accessor :name
    @@all = []
    def initialize (name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select do |songs|
            songs.artist == self
        end
    end

    def new_song (name, genre)
        Song.new(name, self, genre)
    end

    def genres
        genres = []
        self.songs.each do |song|
            # binding.pry
            genres << song.genre
        end
        return genres
    end

    def self.all
        @@all
    end
end
