# Question 1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.include?("Spot")
ages.has_key?("Spot")
ages.member?("Spot")
ages.key?("Spot")

# Question 2
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!   # "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.capitalize! # "The munsters are creepy in a good way."
munsters_description.downcase!   # "the munsters are creepy in a good way."
munsters_description.upcase!     # "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino") # Does not match with dinosaur due to capitalization.
advice.match?("Dino")

# Question 5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w[Fred Barney Wilma Betty BamBam Pebbles]

# Question 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"

# Question 7
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.insert(0, 'Dino', 'Hoppy')
flintstones.push("Dino").push("Hoppy")
flintstones.concat(%w(Dino Hoppy))

# Question 8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!("house training your pet dinosaur.")

advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
p advice # => "house training your pet dinosaur."

# Question 9
statement = "The Flintstones Rock!"
statement.count('t')

# Question 10
title = "Flintstone Family Members"
title.center(40)
