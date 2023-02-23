# ! This script is the basics for methods and if statements.
# ? We will be using everything weve learnt so far

def operations(operation, num_1, num_2)

  puts "Operation #{operation} selected."
  if operation == "Multiply"
    puts num_1*num_2

  elsif operation == "Add"
    puts num_1+num_2

  elsif operation == "Subtract"
    puts num_1-num_2

  elsif operation == "Divide"
    puts num_1/num_2

  else
    puts "Please enter a valid operation."
  end
end

print "Please enter a number:"
user_num_1 = gets.chomp.to_i
print "\nPlease enter a number:"
user_num_2 = gets.chomp.to_i

puts "What operation would you like to do? (add, subtract, multiply, divide)"
answer = gets.chomp.capitalize!


operations(answer,user_num_1,user_num_2)
