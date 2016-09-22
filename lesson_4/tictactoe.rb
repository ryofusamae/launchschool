require 'pry'

INITIAL_MARKER = " ".freeze
PLAYER_MARKER = "X".freeze
COMPUTER_MARKER = "0".freeze
WINNING_PATTERN = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]
SETTING = "choice".freeze

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
  square = nil
  WINNING_PATTERN.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
    break if square
  end

  if !square
    WINNING_PATTERN.each do |line|
      square = find_at_risk_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  if !square
    square = empty_square(brd).sample
  end

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

def who_starts_first?(choice)
  setting = nil
  loop do
    if choice == 'choice'
      prompt "Enter 'computer' for the computer to start or 'player' for player to start"
      setting = gets.chomp.to_sym
      break if setting == :computer || setting == :player
      prompt "Invalid Choice."
    end
  end
  setting
end

def place_piece!(brd, curr_player)
  if curr_player == :computer
    computer_places_piece!(brd)
  elsif curr_player == :player
    user_places_piece!(brd)
  end
end

def alternate_player(curr_player)
  if curr_player == :computer
    return :player
  else
    return :computer
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

# game starts here

loop do
  player_score = 0
  computer_score = 0

  loop do
    board = initialize_board
    current_player = who_starts_first?(SETTING)
    display_board(board)

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      display_board(board)
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

    answer = ""

    loop do
      prompt "keep playing? (y/n)"
      answer = gets.chomp
      if answer.downcase.start_with?("n")
        break
      elsif answer.downcase.start_with?("y")
        break
      else
        prompt "Please enter a valid input"
      end
    end
    break if answer.downcase.start_with?("n")
  end

  if player_score == 5
    prompt "You Win!"
  elsif computer_score == 5
    prompt "Computer wins!"
  end

  prompt "Start from the beginning? (y/n)"
  play_again = gets.chomp
  break unless play_again.downcase.start_with?("y")
end

prompt "Thanks for playing!"
