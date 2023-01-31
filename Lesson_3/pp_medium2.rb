# Question 1
a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id
# => a and c return the same object_id, while be returns its own

# Question 2
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
# => all return the same object_id, because integers are immutable

# Question 3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => My string looks like this now: pumpkins
puts "My array looks like this now: #{my_array}"   # => My array looks like this now: ["pumpkins", "rutabaga"]

# Question 4
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # => My string looks like this now: pumpkinsrutabaga
puts "My array looks like this now: #{my_array}"   # => My array looks like this now: ["pumpkins"]

# Question 5
# This way mutates the arguments
# def tricky_method(a_string_param, an_array_param)
#   a_string_param << "rutabaga"
#   an_array_param << "rutabaga"
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 6
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
# Ruby automatically evaluates statements
def color_valid(color)
  color == "blue" || color == "green"
end