# Question 1
10.times {|idx| puts "#{' ' * idx}The Flintstones Rock!"}

# Question 2
puts "the value of 40 + 2 is " + (40 + 2) # => Returns an error because (40 + 2) is an integer attempting to be concatenated with a string.
1. This could be fixed by using interpolation within the string.
2. This could be fixed by calling Integer#to_s on (40 + 2)

# Question 3
# Original Code:
# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# LS Solution:
while divisor > 0
  factors << number / divisor if number % divisor == 0
  divisor -= 1
end

Bonus 1. The purpose of number % divisor == 0 is to verify that the divisor divides evenly into the number.
Bonus 2. THe purpose of line 8 is to ensure that the desired value is returned from #factors.

# Question 4
The difference between #<< and #+ is that << is destructive, while + returns a new object

# Question 5
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
The problem with this code is that #fib is attempting to access a local variable outside of the method.
  This could be fixed by passing the limit variable to #fib as an argument.

# Question 6
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # => 34

# Question 7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

Wrong ===> No, the Munsters family data did not get mutated because #values (called first on the hash) returns a new array, which is then iterated over.
The data is mutated.

# Question 8
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") #=> "paper"

# Question 9
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo) # => "no"