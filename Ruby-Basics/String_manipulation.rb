# ! This script is the basics for Strings
first_name = 'John'
last_name = 'Doe'

# we can concatenate the strings to a new varibale
full_name = first_name + ' ' + last_name # *- see how its necesary to add a space?

puts 'The full name is : ' + full_name # *$ we print the full name, but remember, theres always more than one way-

puts "the first name is #{first_name} and the last name is #{last_name}"

# ! REMEMBER THAT EVERYTHING IN RUBY IS AN OBJECT!! THIS MEANS THAT THERE ARE BUILT IN METHODS FOR EVERYTHING !
# ? Strings have their own methods:
puts first_name.capitalize! # - this will capitalize the first character of the string

sentence = 'Welcome to the jungle'
puts "Original sentence: \"#{sentence}\""

sentence = sentence.sub('the jungle', 'utopia') # - this method subtitutes a phrase/word in the sentence with the phrase give
puts "Modified sentence: \"#{sentence}\""

# puts ' Methods available for the Strings:'
# puts sentence.methods  #- will return all available methods for the string given "Sentence"

# ? we can also get input from the user and manipulate it.
print 'Enter your name: '
first_name = gets.chomp! # *- chomp! will delete the default line break when the user clicks enter
# ! in ruby we have to cast variables. From Integers we have to cast to String to show the output.
puts "Your first name is: \"#{first_name.capitalize!}\" and its length is #{first_name.length}" # * we can chain methods.
