VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts(message)
end

def display_results(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'Paper' && computer == 'rock') ||
        (player == 'scissors' && computer == 'paper')
    prompt("You win!")
  elsif (player == 'rock' && computer == 'paper') ||
          (player == 'paper' && computer == 'scissors') ||
            (player == 'scissors' && computer == 'rock')
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
