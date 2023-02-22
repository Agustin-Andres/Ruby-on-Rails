# ! This script is the basics for Numbers
# when we work with numbers, we dont use inverted commas !
# * - we have different types of numbers - integers, floats, doubles

puts "Integers don\'t cointain the \".0\" character in ruby. Floats do!"
int = 2

puts "This is a int :#{int} and this is a float :#{int.to_f}"
puts 'We have to KNOW how to manipulate these numbers. If we divide to integers, we will get an integer'
int = 10 / 4
puts "10 / 4 = #{int} - this is wrong. Because of its format, the answer is a float but the numbers worked are integers."
puts ''
float = 10.0 / 4
puts 'However, if we uste at least one float, Ruby will automatically make the answer a float:'
puts "10.0 / 4 = #{float} - this is right. Because of its format"
