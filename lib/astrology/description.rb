class Astrology::Description

    attr_accessor :description, :date_range, :sign, :compatibilty, :mood, :color, :lucky_number, :lucky_time
    @@all = []

    def initialize(description, date_range, sign, compatibilty, mood, color, lucky_number, lucky_time)
        @description = description
        @date_range = date_range
        @sign = sign 
        @compatibilty = compatibilty
        @mood = mood
        @color = color
        @lucky_number = lucky_number
        @lucky_time = lucky_time
        @@all << self

    end

    def self.all
        @@all
    end
end