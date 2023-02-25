# ! This script is the basics for methods and if statements.
# ? We will be using everything weve learnt so far
#we declare the method receiving 3 variables
def operations(operation, num_1, num_2) # * two variables are the user input and the other one is the operation to do

  puts "Operation \"#{operation}\" selected."
  if operation == "Multiply"
    puts "The multiplication of #{num_1} and #{num_2} is: #{num_1*num_2}"

  elsif operation == "Add"
    puts "The addition of #{num_1} and #{num_2} is: #{num_1+num_2}"

  elsif operation == "Subtract"
    puts "The subtraction of #{num_1} and #{num_2} is: #{num_1-num_2}"

  elsif operation == "Divide"
    puts "The division of #{num_1} and #{num_2} is: #{num_1.to_f/num_2.to_f}"

  else
    puts "Please enter a valid operation."
  end
end


#the program actually will begin to run here.
#we get the first two numbes from the user then we get the operation
print "Please enter a number:"
user_num_1 = gets.chomp.to_i
print "\nPlease enter a number:"
user_num_2 = gets.chomp.to_i

puts "What operation would you like to do? (add, subtract, multiply, divide)"
answer = gets.chomp.capitalize!

#here we call the funcion and send the variables.
operations(answer,user_num_1,user_num_2)
