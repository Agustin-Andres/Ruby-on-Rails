# ! basic project to check skills so far

users = [
  { username: 'mashrur', password: 'password1' },
  { username: 'jack', password: 'password2' },
  { username: 'arya', password: 'password3' },
  { username: 'jonshow', password: 'password4' },
  { username: 'heisenberg', password: 'password5' }
]

def compare_user_input_to_database(user_username, user_password, user_database)
  user_database.each do |hash|
   # puts "Comparing #{hash[:username]} to #{user_username} and  \"#{hash[:password]}\" to #{user_password}"
    if hash[:username].to_s == user_username && hash[:password].to_s == user_password
      return hash
    end
  end
  return nil
end

def attempt_again (attempt)
  puts "Would you like to try to login again?"
  print "> "
  answer = gets.chomp

  return (attempt+1) if answer.include?("y")
  if answer.include?("n")
    puts "\nYou have chosen not to try again.\nGoodbye!"
    return (attempt+4)
  end
end


20.times { print '- ' }
puts "\nWelcome to the authenticator!"
puts 'This simple script will take in input from the user and compare it to the database'
puts 'If the username and password is correct, you will get back the user object.'
20.times { print '- ' }

attempts = 1

while attempts < 4
  print "\n Please enter the username: "
  username_input = gets.chomp
  print "\n Please enter the password: "
  password_input = gets.chomp

  object_received = compare_user_input_to_database(username_input, password_input, users)

  #puts "Object received: #{object_received}"

  unless object_received.nil?
    puts "Login successful."
    print "Your object : #{object_received}"
    attempts = 4
  else
    puts "\nError, username or password incorrect."
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

