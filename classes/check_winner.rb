# frozen_string_literal: true

# CheckWinner adds player moves to a series of arrays and then evaluates them to determine a winner
class CheckWinner
  # declare initial arrays used to determine the game's winner
  def initialize
    @p1_r_count = [0, 0, 0]
    @p1_c_count = [0, 0, 0]
    @p2_r_count = [0, 0, 0]
    @p2_c_count = [0, 0, 0]
  end

  # take an array with move data, increment the approptiate player count arrays
  def add_counts(move_data)
    if move_data[0]
      @p1_c_count[move_data[1]] += 1
      @p1_r_count[move_data[2]] += 1
    else
      @p2_c_count[move_data[1]] += 1
      @p2_r_count[move_data[2]] += 1
    end
  end

  # take board state data, evaluate if it's a diagonal, return true if true.
  def diag_win(board)
    diag1 = [board[0][0], board[1][1], board[2][2]]
    diag2 = [board[0][2], board[1][1], board[2][0]]
    win_arrs = [%w[X X X], %w[O O O]]
    if win_arrs.include?(diag1)
      true
    elsif win_arrs.include?(diag2)
      true
    else
      false
    end
  end

  # iterate over all c and r arrays, return true if an element == 3
  def col_row_win
    win = false
    game_win_array = [@p1_c_count, @p1_r_count, @p2_c_count, @p2_r_count]
    game_win_array.each do |i|
      i.each do |j|
        win = true if j == 3
      end
    end
    win
  end

  # accepts a board state array as an argument. If the array has
  # no remaining '#' strings, return true.
  def check_stalemate(board_array)
    @stalemate_array = []

    board_array.each do |i|
      i.map { |j| @stalemate_array << j }
    end

    return unless @stalemate_array.any? { |i| i == '#' } == false

    true
  end
end
