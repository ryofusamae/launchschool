#calculator3

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_num?(num1)
  num1 != 0
end

prompt("Welcome to the calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("You can't leave it blank!")
  else
    break
  end
end

prompt("Hello, #{name}!")

loop do #main loop
num1 = ''
num2 = ''

loop do
  prompt("Enter the first number.")
  num1 = Kernel.gets.chomp.to_i()
  if valid_num?(num1)
    break
  else puts("hmm.. that doesn't seem to be a valid number.")
  end
end

loop do
  prompt("Enter the second number.")
  num2 = Kernel.gets.chomp.to_i()
  if valid_num?(num2)
    break
  else puts("hmm.. that doesn't seem to be a valid number.")
  end
end


prompt("What would you like to perform? 1)Add, 2)Subtract, 3)Multiply, 4)Divide")

operation = ''

loop do
operation = Kernel.gets().chomp()
  if %w(1 2 3 4).include?(operation)
    break
  else
    prompt("Please choose from 1, 2, 3 or 4")
  end
end

result = case operation
when '1'
  result = num1 + num2
when '2'
  result = num1 - num2
when '3'
  result = num1 * num2
when '4'
  result = num1 / num2
end

  prompt("your result is #{result}")

  prompt("would you like to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you, good bye!')
