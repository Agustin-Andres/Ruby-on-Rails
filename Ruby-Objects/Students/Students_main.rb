require_relative "Students_service.rb"
require_relative "Student_object.rb"

puts "Welcome to the Student registry, we save their information, usernames, IDs and passwords."
sleep(5)

id = 1
continue = true
array = []

begin
  system("clear")

  option_entered = gets.chomp




end while continue

def initiaize_program(id,array)
  unless id < 1
    puts "°1 - Add a new student\n°4 - Exit"
    option_entered = gets.chomp
    if option_entered == 1
      return create_student
    else
      puts "Goodbye!"
      exit
    end
  else
    puts "°1 - Add a new student\n°2- Edit an existing student\n°3- Delete a student\n°4 - Exit"
    option_entered = gets.chomp
    puts
    case option_entered
    when 1
      puts "> Creating a new student."
      create_student(id)

    when 2

    end


  end
end

def create_student(id)
  student = Service_students.new(id)
end



agustin = Service_students.new(1)
system("clear")

puts "> Student created successfully!\n"
puts agustin

agustin.edit_student
