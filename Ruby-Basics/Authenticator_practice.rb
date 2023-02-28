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
    puts "#{hash[:username].class} - hash username class #{hash[:password]hash username cl}"
    if hash[:username] == user_username && hash[:password] == user_password
      puts "Correct username and password!!User #{hash[:username]} and password #{hash[:password]} "
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

  object_received = compare_user_input_to_database(username_input, username_input, users)

  puts "Object received: #{object_received}"

end
