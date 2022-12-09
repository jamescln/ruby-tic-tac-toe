require 'pry-byebug'

#Variables
game_playing? = true
player1_turn = true
player2_turn = false

#Classes
class Player
    def initialize(name)
        @name = name
    end
    def test
        puts "Hi, I'm #{@name}"
    end
end

class GameBoard
    def initialize
        @board_array = [['___'],['___'],['___']]
    end
    def display_board
        puts @board_array
    end
    def player_move(selection)
        if selection == 1..3
            #add selection to first array item
        elsif selection == 4..6
            #add selection to second array item
        else
            #add selection to third array item
        end
    end
end

#Objects
board = GameBoard.new
player1 = Player.new(gets)
player2 = Player.new(gets)

#Game Loop
#while game_playing? == true do
    
#end