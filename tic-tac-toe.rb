require 'pry-byebug'

#Variables

#Classes
class Player
    def initialize(name)
        @name = name
    end
    def test
        puts "Hi, I'm #{@name}"
    end
end

#Objects
player1 = Player.new(gets)
player2 = Player.new(gets)
player1.test
player2.test