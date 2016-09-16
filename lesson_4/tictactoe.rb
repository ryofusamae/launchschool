#tictactoe.rb

#1. display the initial empty board
#2. ask user for input
#3. ask computer for input
#4. display updated board
#5. if winner, display winner
#6. if the board is full, display board
#7. if neither winner or the board is full, repeat 2 - 6.
#8. play again?
#9. Goodbye!

def display_board(brd)
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def initialize_board
  new_board = {}
  (1..9).each {|num| new_board[num] = ' ' }
  new_board
end

board = initialize_board
display_board(board)
