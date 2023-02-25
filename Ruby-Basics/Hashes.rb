# ! The basics for Hashes
# ? hashes are common, theyre also called dictrionary
# + this is the basic structure of a hash. it contains a key and a value, separated by commas
sample_hash = { 'a' => 1, 'b' => 2, 'c' => 3 }

# ¿ in rails, this hash contains a symbol as a key. this hash structure deals with symbols, the above example uses strings
another_hash = { a: 1, b: 2, c: 3 }
puts another_hash

# + we can reference the key or the value from hashes using []
puts 'a : ' + another_hash[:a].to_s

puts "The keys in the hash are : #{another_hash.keys} and their values are : #{another_hash.values}"


=begin
# ? we can also iterate over the hashes, we need to select both key and value !
dog_hash = { 'Timmy' => 'German shepperd', 'Bob' => 'Bulldog', 'Spots' => 'Border collie', 'Princess' => 'Pitbull' }
dog_hash.each do |key, value|
  puts "#{key}\'s breed is #{value}"
end

# ? to add a new key and value to the hash we need to select the hash, add key and asign a value, to change it is the same
dog_hash['Hound'] = 'Rottweiler'
dog_hash['Bob'] = 'Poodle'

dog_hash.each do |key, value|
  puts "- #{key}\'s breed is #{value}"
end
20.times { print '- ' }
puts
# ? when working with hashes we can also use conditionals.

dog_hash['a'] = 3
dog_hash['b'] = 4
dog_hash['c'] = 5
dog_hash['d'] = 2

dog_hash.each { |key, value| puts "+#{key}\'s breed is #{value}" }
20.times { print '- ' }

# + dog hash now contains integers and strings. We can filter them out using .select
20.times { print '- ' }
puts "\n\n*Strings from the hash:*"
dog_hash.select do |key, value|
  print "\n\n#{key} is a #{value}" if key.is_a?(String) && value.is_a?(String)
end

# + now we sort filter the integers
20.times { print '- ' }
puts "\n*Integers from the hash:*"
dog_hash.select do |key, value|
  print "\n#{key} is a #{value}" if key.is_a?(String) && value.is_a?(Integer)
end
=end
# ? we can not only sort but also delete.
# + here we say that ruby must remove the key (and value) if the value is a String, we filter out and delete the Strings.
food_hash = { 'spaghetti' => 'easy', 'rice' => 'easy', 'roasted chicken' => 'moderately easy', 'roasted beef' => 'moderately easy',
  'beef wellington' => 'hard', 'Chicken pot pie' => 'hard' }

answer = "moderately easy"
food_hash.select do |key, value|
unless value == answer
food_hash.delete(key)
end
end

food_hash.each do |key, value|
puts key + " is #{value} to make"
end

