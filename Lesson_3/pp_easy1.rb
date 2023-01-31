# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
# => [1, 2, 3] WRONG
# => 1
# => 2
# => 2
# => 3

# Question 2
1. != is 'does not equal', use it in expressions to exclude the result
2. putting ! before something calls for anything that is not that value
3. putting ! after something is syntax for a mutating method
4. putting ? before something calls for 1 or 0 of the following argument
5. ""
6. putting !! before something turns it into a boolean value

!= means "not equals"
? : is the ternary operator for if...else
!!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
!<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.

# Question 3
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')

# Question 4
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # Deletes at index 1
numbers.delete(1)    # Deletes the value 1

# Question 5
range = 10..100
range.include?(42)

(10..100).cover?(42)

# Question 6
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
famous_words.insert(0, "Four score and ")
"Four score and " + famous_words
"Four score and " << famous_words

# Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
flintstones.flatten!

# Question 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.rassoc(2)
flintstones.assoc("Barney")