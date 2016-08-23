#simple calculator

puts 'Enter a first number'
num1 = gets.chomp.to_i
puts 'Enter a second number'
num2 = gets.chomp.to_i
puts 'What would you like to do with these? You can either type +, -, * or /'
operation = gets.chomp.to_sym

puts num1.send(operation, num2)
