class Game
  def initialize
    puts 'Welcome, start game'
    display_board
  end

  def display_board(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '----------'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '----------'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

  board = Array.new(9, ' ')

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                      [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]]

  def chosen_position
    print 'Please choose a number between 1 and 9:'
    position = gets.chomp.to_i - 1
    board[position] = player.sign
  end
end
