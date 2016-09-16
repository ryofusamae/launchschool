def empty_paragraph()
    puts("")
end

def question(number)
  puts("Question #{number}")
end

question(1)
  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  ages.key?("spot")

empty_paragraph

question(2)

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  puts (ages.values.inject(:+))

empty_paragraph

question(3)

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  ages.keep_if {|_, age| age < 100}

empty_paragraph

question(5)

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  additional_ages = { "Marilyn" => 22, "Spot" => 237 }

  puts ages.merge!(additional_ages)

empty_paragraph

question(6)

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
  puts(ages.values.min)

empty_paragraph

question(7)

  advice = "Few things in life are as important as house training your pet dinosaur."
  advice.match("Dino")

empty_paragraph
