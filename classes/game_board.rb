# frozen_string_literal: true

# GameBoard handles the board state and processing player moves.
class GameBoard
  def initialize(player1 = 'player1', player2 = 'player2')
    @p1_name = player1
    @p2_name = player2
    @p1_turn = true
    @p_symbol = 'X'
    @board = [['#', '#', '#'], ['#', '#', '#'], ['#', '#', '#']]
    @row = 0
    @col = 0
  end

  # return the current board state
  def current_board
    @board
  end

  # return the name of the active player
  def active_player
    @p1_turn ? @p1_name.chomp : @p2_name.chomp
  end

  # take an array, check if the elements are within an acceptable range
  # then mutate the @col and @row variables to match
  def player_input(player_move)
    player_move.map! {|element| element.to_i}
    return unless player_move.none? { |element| element < 1 || element > 3 }

    @col = player_move[0] - 1
    @row = player_move[1] - 1
  end

  # switch the player1_turn and player_symbol instance variables
  def change_player
    @p1_turn = @p1_turn ? false : true
    @p_symbol = @p1_turn ? 'X' : 'O'
  end

  # output the current board state to the console in a 3x3 grid
  def display_board
    puts 'Current Board State:'
    @board.each do |i|
      i.each {|j| print "#{j} "}
      print "\n"
    end
  end

  # return false unless the space selected by the player is empty
  def move_validate
    return false unless @board[@col][@row] == '#'

    true
  end

  # return the displayed values in an array
  def data_output
    [@p1_turn, @col, @row]
  end

  # place player symbol into board at the desired location
  def place_symbol
    @board[@col][@row] = @p_symbol
  end
end
