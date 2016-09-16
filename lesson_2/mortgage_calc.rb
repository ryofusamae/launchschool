puts("Welcome to mortgage calculator!")

loop do
  loan_amnount = ''

  loop do
    puts("Please enter the amount of loan")
    loan_amnount = gets.chomp.to_f
    if loan_amount < 0
      puts("Please enter a positive number")
    else
      break
    end
  end

  apr_in_float = ''

  loop do
    puts("Please enter the Annual Percentage Rate")
    apr = gets.chomp.to_f

    if apr > 100
      puts("That's impossible!!")
    elsif apr <= 0
      puts("Sorry, that's not a valid rate")
    else
      apr_in_float = apr / 100
      break
    end
  end

  loan_dur = ''
  loop do
    puts("Please enter the loan duration in months")
    loan_duration = gets.chomp.to_i

    if loan_duration <= 0
      puts("Please enter 1-12")
    else
      break
    end
  end

  monthly_interest_rate = apr_in_float / 12

  monthly_payment =
    loan_amn * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-loan_dur))

  puts("Your monthly payment is #{monthly_payment}")
  puts("Would you like to calculate again?")

  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

puts("Thank you for using the calculator!")
