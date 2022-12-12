require 'pry-byebug'

#Variables
game_playing = true
player1_turn = true

#Classes
class Player
    def initialize(name)
        @name = name
    end
    def name
        return @name.chomp
    end
    
end

class GameBoard
    def initialize
        @board_array = [['#','#','#'],['#','#','#'],['#','#','#']]
        @row = 0
        @column = 0
    end
    def display_board
        puts @board_array[0][0] + @board_array[0][1] + @board_array[0][2]
    end
    def row_select(row)
        @row = row.to_i - 1
    end
    def column_select(column)
        @column = column.to_i - 1
    end
    def place_symbol(symbol)
        @board_array[@row][@column] = symbol
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
    #sets player symbol
    player_symbol = player1_turn ? 'X' : 'O'
    #get player input
    puts "#{player1_turn ? player1.name : player2.name}, it's your turn! Enter the row you wish to select (1, 2 or 3)"
    board.row_select(gets)
    puts "Now enter the column you want to select (1, 2 or 3)"
    board.column_select(gets)
    #place the player's symbol in the desired location
    board.place_symbol(player_symbol)
    #output board state
    board.display_board
    #change player turn and player symbol
    player1_turn ? false : true
#end