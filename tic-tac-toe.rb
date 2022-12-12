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
        puts "Current Board State:"
        puts "#{@board_array[0][0]}  #{@board_array[0][1]}  #{@board_array[0][2]}"
        puts "#{@board_array[1][0]}  #{@board_array[1][1]}  #{@board_array[1][2]}"
        puts "#{@board_array[2][0]}  #{@board_array[2][1]}  #{@board_array[2][2]}"
    end
    def row_select(row)
        @row = row.to_i - 1
    end
    def column_select(column)
        @column = column.to_i - 1
    end
    def place_symbol(symbol)
        puts "Enter the row you wish to select (1, 2 or 3)"
        self.row_select(gets)
        puts "Enter the column you wish to select (1, 2 or 3)"
        self.column_select(gets)
        if @board_array[@row][@column] == 'X' || @board_array[@row][@column] == 'O'
            puts "That space is taken. Please select an empty space."
            self.place_symbol(symbol)
        else
            @board_array[@row][@column] = symbol
        end
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
for i in 0..1 do 
    #sets player symbol
    player_symbol = player1_turn ? 'X' : 'O'
    puts "#{player1_turn ? player1.name : player2.name}, it's your turn!"
    # get player input and place the player's symbol in the desired location
    board.place_symbol(player_symbol)
    #output board state
    board.display_board
    #change player turn and player symbol
    player1_turn ? player1_turn = false : player1_turn = true
end