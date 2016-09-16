=begin

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep


empty_paragraph()
    puts("")
end

def question(number)
  puts("Question #{number}")
end

question(1)
  numbers = [1, 2, 2, 3]
  numbers.uniq
  puts numbers

empty_paragraph()

question(3)

  advice = "Few things in life are as important as house training your pet dinosaur."
  puts advice
  advice.gsub!('important', 'urgent')
  puts advice

empty_paragraph()

question(4)

  numbers = [1, 2, 3, 4, 5]

  numbers.delete_at(1)
  puts(numbers)
  numbers.delete(1)
  puts(numbers)

empty_paragraph

question(5)
  puts("Programmatically determine if 42 lies between 10 and 100.")

  (10..100).cover?(42)

empty_paragraph

question(6)

  famous_words = "seven years ago..."
  puts famous_words

  puts "Four score and " << famous_words
  puts "Four score and " + famous_words

empty_paragraph

question(8)

  flintstones = ["Fred", "Wilma"]
  flintstones << ["Barney", "Betty"]
  flintstones << ["BamBam", "Pebbles"]

  print flintstones

  flintstones.flatten!

  print flintstones

empty_paragraph

question(9)

  flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

  print flintstones.assoc("Barney")

empty_paragraph



  flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

  flintstones_hash = {}
  flintstones.each_with_index do |index, name|
    flintstones_hash[name] = index
  end

  puts flintstones_hash
=end

statement = "The Flintstones Rock"
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end
puts result

puts "the value of 40 + 2 is " + (40 + 2).to_s
