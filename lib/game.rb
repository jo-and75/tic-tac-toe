require_relative 'DrawBoard'
class Game  
  def initialize  
    loop do
    print 'Player 1, PLEASE CHOOSE YOUR PLAYER NAME: '
      @player_1 = gets.upcase.chomp
      print 'Player 2, PLEASE CHOOSE YOUR PLAYER NAME: '
      @player_2 = gets.upcase.chomp
      break if @player_1 != @player_2
    end
    @board_drawer = DrawBoard.new
    select_symbols
  end 

  def select_symbols  
    loop do
      print "#{@player_1}, please choose your symbol (X or O): "
        @player_1_symbol = gets.downcase.chomp
        print "#{@player_2}, please choose your symbol (X or O): "
        @player_2_symbol = gets.downcase.chomp

        if @player_1_symbol != @player_2_symbol && ((@player_1_symbol == "x" || @player_1_symbol == "o") && (@player_2_symbol == "x" || @player_2_symbol == "o"))
          break
        else
          puts "Symbols must be either 'X' or 'O' and must be different. Please reselect."
        end
    end  
    player_moves
  end 
end 
