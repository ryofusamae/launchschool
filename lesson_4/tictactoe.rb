require 'pry'

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "0"

WINNING_PATTERN = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}"
  puts "Computer is a #{COMPUTER_MARKER}"
  puts "Whoever earn 5 points first is the winner!"
  puts " "
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts " "
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_square(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def user_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_square(brd).join(', ')})"
    square = gets.chomp.to_i
    break if empty_square(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_square(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_square(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_PATTERN.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do

  player_score = 0
  computer_score = 0

  loop do

    board = initialize_board
    display_board(board)

    loop do
      user_places_piece!(board)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      display_board(board)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      prompt "#{detect_winner(board)} +1!"
      if detect_winner(board) == "Player"
        player_score += 1
      elsif detect_winner(board) == "Computer"
        computer_score += 1
      end

    else
      prompt "It's a tie."
    end

    prompt "Your score: #{player_score}, Computer score: #{computer_score}"

    break if player_score == 5 || computer_score == 5

    prompt "keep playing? (y/n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?("y")
  end

  if player_score == 5
    prompt "You Win!"
  else
    prompt "Computer wins!"
  end

  prompt "Play again? (y/n)"
  play_again = gets.chomp
  break unless play_again.downcase.start_with("y")
end

prompt "Thanks for playing!"
