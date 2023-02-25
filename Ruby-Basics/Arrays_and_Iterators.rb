# ! This script is the basics for arrays and iterators
# ? arrays can contain anything, numbers, strings, chars, other arrays, hashes, objects etc

# +arrays have an index, they start from 0 and increment to the last item.
# +a = [0,1,2,3,4,5,6,7,8,9] these are the positions of the array given
 a = [1,2,3,4,5,6,7,8,9,10]
print a.to_s + "\n\n"

# ! =begin
# + in ruby we also have a class called range, it will give a range from the numbers given.

x = 5..15
puts "X is a range(#{x.to_s}), this is the class: " + x.class.to_s
# +we can also use the range for chars - "a".."z"


# +we can also cast this range to an array of integers.
casted_array = x.to_a
puts "Casted_array is an array derived from x, this is the class: " + casted_array.class.to_s
puts "Casted_array is: #{casted_array.to_a} \n"
puts "we can also shuffle the array : #{casted_array.shuffle.to_s}"

# + to append an element to the array we use "<<"

a = a << 11 # * or we can use "append" - a = a.append(11)
puts a.last

# ? push will add an item as well to the array
a.push("Last item")

# ? .pop will remove an element from the array and return it (LIFO - las in first out)
 last_element = a.pop()
 puts "a : #{a} \n - b: #{last_element}"

# ? we can also add each element from the array to a string
a_string = a.join
a_string_separator = a.join("-")

puts "a_string : #{a_string} \n - a_string_separator : #{a_string_separator}"

# + From the string with a separator, we can change it to an array!
b = a_string_separator.split("-")
puts "b : #{b}"  #! Remember this will return a string!! items from a string will remain a string

#! Iterators




#! =end



#puts a.methods
