# frozen_string_literal: true

require_relative 'classes/game_board'
require_relative 'classes/check_winner'

# Instances
puts 'Players, type your names, then press enter!'
board = GameBoard.new(gets, gets)
win_checker = CheckWinner.new

# Variables
game_playing = true

# Game Loop
while game_playing == true

  # output a message with a player name to the console
  puts "#{board.active_player}, it's your turn!"

  valid_move = false

  while valid_move == false
    # generate an empty array
    player_move = []
    # get player input and pass to the array
    puts 'Enter the column you wish to select (1, 2 or 3)'
    player_move << gets
    puts 'Enter the row you wish to select (1, 2 or 3)'
    player_move << gets
    # pass the array to the board player_input method
    board.player_input(player_move)
    # call move_validate method to see if the move is legal
    if board.move_validate
      board.place_symbol
      valid_move = true
    else
      puts 'Move invalid, please select an empty space'
    end

    # pass move information from board to win_checker
    win_checker.add_counts(board.data_output)
    # clear the array before the next turn
    player_move.clear
  end

  # output board state to the console
  board.display_board

  # check for a winner
  if win_checker.col_row_win || win_checker.diag_win(board.current_board)
    game_playing = false
    puts "#{board.active_player} wins!"
  end

  # check for a stalemate
  if win_checker.check_stalemate(board.current_board)
    game_playing = false
    puts "It's a draw!"
  end

  # change player
  board.change_player

end
