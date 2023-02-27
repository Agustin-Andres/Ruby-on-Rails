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
    hash.each do |k, v|
      puts "---- comparing #{k} to #{user_username} and #{v} to #{user_password} ----"
      return true if k == user_username && v == user_password

      return false
    end
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
  if compare_user_input_to_database(username_input, username_input, users)
    puts "\n Success! You are now authenticated as: #{username_input}"
    users.each { |k, v| print "\n your object is #{users[k]}" if v == username }

  else
    puts 'You have not entered a correct username or password.'
    puts 'press n to try again, or q to quit.'
    answer = gets.chomp.to_s.capitalize!

    if answer == 'Q'
      puts 'you have chosen to exit, Goodbye!'
      attempts = 4
    else
      attempts += 1
    end
  end

end
