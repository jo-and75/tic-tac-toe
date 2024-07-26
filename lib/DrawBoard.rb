class DrawBoard
  attr_accessor :board
  def initialize
    @board = Array.new(9, ' ') 
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '----------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '----------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def set_position(index, symbol)
    if @board[index] == " " 
      @board[index] = symbol  
      display_board
      return true 
    else  
      puts "Position already taken. Please try again."
      return false
    end
  end 
end