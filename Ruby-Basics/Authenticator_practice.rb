# ! basic project to check skills so far

# ¿ an array containing hashes.
users = [
  { username: 'mashrur', password: 'password1' },
  { username: 'jack', password: 'password2' },
  { username: 'arya', password: 'password3' },
  { username: 'jonshow', password: 'password4' },
  { username: 'heisenberg', password: 'password5' }
]

# ? This methid is to compare the user input (user and pass) to the hashes inside the array
def compare_user_input_to_database(user_username, user_password, user_database)
  # + for each hash we compare the username and pass to the input, if any match we return the object. Otherwise we return nil
  user_database.each do |hash|
   # puts "Comparing #{hash[:username]} to #{user_username} and  \"#{hash[:password]}\" to #{user_password}"
    if hash[:username].to_s == user_username && hash[:password].to_s == user_password
      return hash
    end
  end
  return nil
end

# ? This method is asking the user if they and want to try again after every failed attempt.
def attempt_again(attempt)
  print "Would you like to try to login again? (y/n) \n> "
  answer = gets.chomp.downcase

  # + we use a case and iteration, if they answer y - it will return the attempt+1
  # + if they anser n we return an exceeding amount of attempts
  # + if they put an invalid answer, we call the method again.
  case answer
  when "y"
    attempt + 1
  when "n"
    puts "\nYou have chosen not to try again.\nGoodbye!"
    attempt + 4
  else
    puts "Invalid answer. Please enter y or n."
    attempt_again(attempt)
  end
end



20.times { print '- ' }
puts "\nWelcome to the authenticator!"
puts 'This simple script will take in input from the user and compare it to the database'
puts 'If the username and password is correct, you will get back the user object.'
20.times { print '- ' }
# ? attempt to set the amount of attempts the user has. THey have 3-
attempts = 1

# + while loop to keep asking the user for data
while attempts < 4
  print "\n Please enter the username: "
  username_input = gets.chomp
  print "\n Please enter the password: "
  password_input = gets.chomp

  # + Object will either be nil or have an object returned from the method called.
  object_received = compare_user_input_to_database(username_input, password_input, users)

  #puts "Object received: #{object_received}"

  # + Unless the object is nil, the login is succesessfull, otherwise we ask if they want to try again..
  # + or, they've exceeded the maximum amount of attemps.
  unless object_received.nil?
    puts "Login successful."
    print "Your object : #{object_received}"
    attempts = 4
  else
    puts "\nError, username or password incorrect."
    # + we use unless to check the amount of atempts the user has. If they have tried 3 times, the program...
    # + will end.
    unless attempts == 3
      attempts = attempt_again(attempts)
    else
      attempts = 4
      puts "You have exceeded the maximum number of attempts"
    end
  end

end
puts
20.times { print '- ' }

