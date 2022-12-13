require 'pry-byebug'

arr = [['#','#','#'],['#','#','#'],['#','#','#']]
arr_map = []
arr.each do |i|
  i.map{|j| arr_map << j}
end
arr_comparison = arr_map.any? {|i| i == '#'}

#Variables
$game_playing = true
player1_turn = true
puts "Player 1, type your name!"
player1_name = gets
puts "Player 2, type your name!"
player2_name = gets

#Classes
class GameBoard
    def initialize (player1 = 'player1',player2 = 'player2')
        @player1_name = player1
        @player2_name = player2
        @board_array = [['#','#','#'],['#','#','#'],['#','#','#']]
        @row = 0
        @column = 0
        @player1_row_count = [0,0,0]
        @player1_col_count = [0,0,0]
        @player1_diag_count = [0,0]
        @player2_row_count = [0,0,0]
        @player2_col_count = [0,0,0]
        @player2_diag_count = [0,0]
    end
    def turn_set(turn)
        @player1_turn = turn
    end
    def display_board
        puts "Current Board State:"
        puts "#{@board_array[0][0]}  #{@board_array[0][1]}  #{@board_array[0][2]}"
        puts "#{@board_array[1][0]}  #{@board_array[1][1]}  #{@board_array[1][2]}"
        puts "#{@board_array[2][0]}  #{@board_array[2][1]}  #{@board_array[2][2]}"
    end
    def column_select(column)
        @column = column.to_i - 1
        if @column == 0 || @column == 1 || @column == 2
            @player1_turn ? @player1_col_count[@column] += 1 : @player2_col_count[@column] += 1
        else
            puts "Please select a valid value"
            self.column_select(gets)
        end
    end
    def row_select(row)
        @row = row.to_i - 1
        if @row == 0 || @row == 1 || @row == 2
            @player1_turn ? @player1_row_count[@row] += 1 : @player2_row_count[@row] += 1
        else
            puts "Please select a valid value."
            self.row_select(gets)
        end
    end
    def place_symbol(symbol)
        
        puts "Enter the column you wish to select (1, 2 or 3)"
        self.column_select(gets)
        
        puts "Enter the row you wish to select (1, 2 or 3)"
        self.row_select(gets)

        if @board_array[@row][@column] == 'X' || @board_array[@row][@column] == 'O'
            @player1_turn ? @player1_row_count[@row] -= 1 : @player2_row_count[@row] -= 1
            @player1_turn ? @player1_col_count[@column] -= 1 : @player2_col_count[@column] -= 1
            puts "That space is taken. Please select an empty space."
            self.place_symbol(symbol)
        else
            @board_array[@row][@column] = symbol
        end
    end
    def check_winner
        if @player1_turn == true
            for i in 0..2 do
                if @player1_row_count[i] == 3 || @player1_col_count[i] == 3
                    $game_playing = false
                    puts "#{@player1_name.chomp} wins!"
                end
            end
        else
            for i in 0..2 do
                if @player2_row_count[i] == 3 || @player2_col_count[i] == 3
                    $game_playing = false
                    puts "#{@player2_name.chomp} wins!"
                end
            end
        end
        if @board_array[0][0] == 'X' && @board_array[1][1] == 'X' && @board_array[2][2] == 'X' || @board_array[0][2] == 'X' && @board_array[1][1] == 'X' && @board_array[2][0] == 'X'
            $game_playing = false
            puts "#{@player1_name.chomp} wins!"
        elsif @board_array[0][0] == 'O' && @board_array[1][1] == 'O' && @board_array[2][2] == 'O' || @board_array[0][2] == 'O' && @board_array[1][1] == 'O' && @board_array[2][0] == 'O'
            $game_playing = false
            puts "#{@player2_name.chomp} wins!"
        end
    end
    def check_stalemate

        @stalemate_array = []

        @board_array.each do |i|
           i.map {|j| @stalemate_array << j}
        end
        
        @stalemate = @stalemate_array.any? {|i| i == '#'}
        
        if @stalemate == false
            $game_playing = false
            puts "It's a draw!"
        end
    end
end

#Instances
board = GameBoard.new(player1_name,player2_name)
board.turn_set(player1_turn)

#Game Loop
while $game_playing == true do
#for i in 0..1 do 
    #sets player symbol
    player_symbol = player1_turn ? 'X' : 'O'
    puts "#{player1_turn ? player1_name.chomp : player2_name.chomp}, it's your turn!"
    # call the place_symbol method on the board instance
    board.place_symbol(player_symbol)
    #output board state
    board.display_board
    #check for a winner
    board.check_winner
    #check for a stalemate
    board.check_stalemate
    #change player turn and player symbol
    player1_turn ? player1_turn = false : player1_turn = true
    board.turn_set(player1_turn)
end