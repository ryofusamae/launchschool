#calculator alternative way

puts 'Welcome to the calculator! Enter the first number.'
num1 = gets.chomp.to_i()
puts 'Enter the second number.'
num2 = gets.chomp.to_i()

puts 'What would you like to perform? 1)Add, 2)Subtract, 3)Multiply, 4)Divide'
operation = gets.chomp()

if operation == '1'
  result = num1() + num2()
elsif operation == '2'
  result = num1() - num2()
elsif operation == '3'
  result = num1() * num2()
elsif operation == '4'
  result = num1() / num2()
else
  puts("please choose an option between 1 - 4")
end

  puts("your result is #{result}")
