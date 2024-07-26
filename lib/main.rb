require_relative 'DrawBoard'
require_relative 'Game' 

puts "GAME INSTRUCTIONS
1. THE BOARD IS NUMBERED HORIZONTALLY FROM 1 TO 9 MOVING LEFT TO RIGHT
2. EACH NUMBER CORRESPONDS TO A POSITION ON THE BOARD
3. THE NUMBER YOU PICK CORRESPONDS WILL CORRESPOND TO THE POSITION OF THE SYMBOL UNLESS THAT POSITION IS FILLED
4. FIRST PLAYER TO GET 3 IN A ROW WINS
          GOODLUCK!!"

def player_moves
    @player_1_positions = [] 
    @player_2_positions = []  

    catch(:done) do
      loop do
          loop do 
            print "#{@player_1}, please choose a number between 0 and 9: "
            @player_1_choice = gets.chomp.to_i 

            if @player_1_choice.between?(1,9)  
               @player_1_choice -= 1
                if @board_drawer.set_position(@player_1_choice,@player_1_symbol)
                   @player_1_positions << @player_1_choice 
                  break
                end
            else
              puts "Invalid input. Please try again."
            end     
          end

          if @board_drawer.board.include?(" ") == false
            throw :done  
          end  

          if @player_1_positions.length == 3 
            if WIN_COMBINATIONS.include?(@player_1_positions)  
              puts "3 IN A ROW, PLAYER 1 WINS!!!"
              break    
            end  
          elsif @player_1_positions.length >= 4
              @player_1_positions.combination(3) {|combination| 
                if WIN_COMBINATIONS.include?(combination)  
                  puts "3 IN A ROW, PLAYER 1 WINS!!!" 
                  throw :done
                end
              }   
          end 

          loop do
            print "#{@player_2}, please choose a number between 0 and 9: "
            @player_2_choice = gets.chomp.to_i 

            if @player_2_choice.between?(1,9)  
               @player_2_choice -= 1
                if @board_drawer.set_position(@player_2_choice,@player_2_symbol)
                   @player_2_positions << @player_2_choice 
                   break 
                end
            else
              puts "Invalid input. Please try again."
            end     
          end   

          if @player_2_positions.length == 3
            if WIN_COMBINATIONS.include?(@player_2_positions)  
              puts "3 IN A ROW, PLAYER 2 WINS!!!"
              break    
            end  
          elsif @player_2_positions.length >= 4
              @player_2_positions.combination(3) {|combination| 
                if WIN_COMBINATIONS.include?(combination)
                  puts "3 IN A ROW, PLAYER 2 WINS!!!"
                  throw :done 
                end
              }
          end 
        end   
      end 
  end  

WIN_COMBINATIONS = [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0],
  [3, 4, 5], [3, 5, 4], [4, 3, 5], [4, 5, 3], [5, 3, 4], [5, 4, 3],
  [6, 7, 8], [6, 8, 7], [7, 6, 8], [7, 8, 6], [8, 6, 7], [8, 7, 6],
  [0, 3, 6], [0, 6, 3], [3, 0, 6], [3, 6, 0], [6, 0, 3], [6, 3, 0],
  [1, 4, 7], [1, 7, 4], [4, 1, 7], [4, 7, 1], [7, 1, 4], [7, 4, 1],
  [2, 5, 8], [2, 8, 5], [5, 2, 8], [5, 8, 2], [8, 2, 5], [8, 5, 2],
  [6, 4, 2], [6, 2, 4], [4, 6, 2], [4, 2, 6], [2, 6, 4], [2, 4, 6],
  [0, 4, 8], [0, 8, 4], [4, 0, 8], [4, 8, 0], [8, 0, 4], [8, 4, 0]] 
  
game = Game.new



