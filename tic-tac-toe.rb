require 'pry-byebug'

#Variables
game_playing = true
player1_turn = true
puts "Player 1, type your name!"
player1_name = gets
puts "Player 2, type your name!"
player2_name = gets

#Classes
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
    def check_winner
        check_1 = []
        check_2 = []
        check_3 = []
        for i in 0..2 do
            for j in 0..2 do
                check_1 << @board_array[i][j]
                check_2 << @board_array[j][i]
            end
            
            unless check_1[0] == '#' || check_2[0] == '#'    
                if check_1[0] == check_1[1] && check_1[0] == check_1[2]
                    if check_1[0] == 'X'
                        puts "#{player1_name} wins!"
                    elsif check_1[0] == "O"
                        puts "#{player2_name} wins!"
                    end
                elsif check_2[0] == check_2[1] && check_2[0] == check_2[2]
                    if check_2[0] == 'X'
                        puts "#{player1_name} wins!"
                    elsif check_2[0] == "O"
                        puts "#{player2_name} wins!"
                    end
                else
                    check_1.clear
                    check_2.clear
                end
            end
        end
    end
end

#Instances
board = GameBoard.new

#Game Loop
#while game_playing == true do
for i in 0..1 do 
    #sets player symbol
    player_symbol = player1_turn ? 'X' : 'O'
    puts "#{player1_turn ? player1_name.chomp : player2_name.chomp}, it's your turn!"
    # call the place_symbol method on the board instance
    board.place_symbol(player_symbol)
    #output board state
    board.display_board
    #check for a winner
    board.check_winner
    #change player turn and player symbol
    player1_turn ? player1_turn = false : player1_turn = true
end