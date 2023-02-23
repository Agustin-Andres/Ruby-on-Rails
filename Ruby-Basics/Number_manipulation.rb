# ! This script is the basics for Numbers
# when we work with numbers, we dont use inverted commas !
# * - we have different types of numbers - integers, floats, doubles

puts "Integers don\'t cointain the \".0\" character in ruby. Floats do!"
int = 2

puts "This is a int :#{int} and this is a float :#{int.to_f}"
puts "We have to KNOW how to manipulate these numbers. If we divide to integers, we will get an integer"
int = 10 / 4
puts "10 / 4 = #{int} - this is wrong. Because of its format, the answer is a float but the numbers worked are integers.\n"

float = 10.0 / 4
puts "However, if we uste at least one float, Ruby will automatically make the answer a float:"
puts "10.0 / 4 = #{float} - this is right. Because of its format\n"

# ? we can also multiply numbers AND strings for diferent outputs.

output = "Hello " * 5
puts "\"Hello * 5  \" = " + output #the string is being multiplied by 5

output = "5 " * 5
puts "\"5\" * 5 = " + output + " the initial \"5\" is a string." # the same thing as above

output = 5 * 5
puts "\"5 * 5\" = " + output.to_s + " the initial \"5\" is an integer.\n" #here we are working with integers.
# ? we can also work with the ".times{}" method usting integers
30.times {
  print "#"
}
puts "\nAvailable methods for integers :" + 10.methods.to_s

30.times {
  print "#"
}

print "\nEnter a number: "
first_num = gets.chomp
print "\nEnter a number: "
second_num = gets.chomp

puts "\n#{first_num.to_s} + #{second_num.to_s} = #{first_num.to_i + second_num.to_i}"
puts "#{first_num.to_s} - #{second_num.to_s} = #{first_num.to_i - second_num.to_i}"
puts "#{first_num.to_s} * #{second_num.to_s} = #{first_num.to_i * second_num.to_i}"
puts "#{first_num.to_s} / #{second_num.to_s} = #{first_num.to_f / second_num.to_f}"
puts "#{first_num.to_s} % #{second_num.to_s} = #{first_num.to_i % second_num.to_i}"
