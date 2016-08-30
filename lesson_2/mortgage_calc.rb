puts("Welcome to mortgage calculator!")

loop do
  loan_amn = ''

  loop do
    puts("Please enter the amount of loan")
    loan_amn = gets.chomp.to_f
    if loan_amn < 0
      puts("Please enter a positive number")
    else
      break
    end
  end

  apr_in_float = ''

  loop do
    puts("Please enter the Annual Percentage Rate")
    apr = gets.chomp.to_i

    if apr > 100
      puts("That's impossible!!")
    else
      apr_in_float = apr.to_f / 100
      break
    end
  end

  puts("Please enter the loan duration in months")

  loan_dur = gets.chomp.to_i

  monthly_int_rate = apr_in_float / 12

  monthly_payment =
    loan_amn * (monthly_int_rate / (1 - (1 + monthly_int_rate)**-loan_dur))

  puts("Your monthly payment is #{monthly_payment}")
  puts("Would you like to calculate again?")

  answer = gets.chomp

  break unless answer.downcase.start_with?("y")
end

puts("Thank you for using the calculator!")
