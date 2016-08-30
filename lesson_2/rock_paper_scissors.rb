VALID_CHOICES = %w(rock paper scissors lizzard spock)

def prompt(message)
  Kernel.puts(message)
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'Paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'lizzard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizzard') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'lizzard') ||
    (first == 'lizzard' && second == 'paper') ||
    (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer win!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome!")

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That is not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  prompt("You chose #{choice} and the computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Would you like to do it again?")
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for playing!")
