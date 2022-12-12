require 'pry-byebug'

#Variables
game_playing = true
player1_turn = true
player_symbol = player1_turn ? 'X' : 'O'

#Classes
class Player
    def initialize(name)
        @name = name
    end
    def test
        puts "Hi, I'm #{@name}"
    end
    def name
        return @name.chomp
    end
end

class GameBoard
    def initialize
        @board_array = [['___'],['___'],['___']]
    end
    def display_board
        puts @board_array
    end
    def player_move(row, column)
        
    end
end

#Objects / Init
board = GameBoard.new
puts "Player 1, type your name!"
player1 = Player.new(gets)
puts "Player 2, type your name!"
player2 = Player.new(gets)

#Game Loop
#while game_playing == true do
puts "#{player1_turn ? player1.name : player2.name}, it's your turn! Enter the row you wish to select (A, B or C)"

    
#end