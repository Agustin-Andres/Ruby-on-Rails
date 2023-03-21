require_relative "Students_service.rb"
require_relative "Student_object.rb"

def ini_program(id)
  system("clear")
  unless id < 1
    print "> Initial menu <\n °1 - Add a new student\n °4 - Exit\n > "
    option_entered = gets.chomp
    if option_entered.to_i == 1
      return create_student(id)
    else
      puts "Goodbye!"
      exit
    end
  end
end

def cont_program(id, array)
  system("clear")
  print "> Extended menu <\n> 1 - Add a new student\n> 2 - View a student\n> 3 - Edit a student \n> °4 - Exit\n > "
  choice = gets.chomp

  #Case to the methods chosen
  case choice
  when "1"
    puts "Creating a new student."
    array.append(create_student(id))
    puts array[0]
  when "2"
    view_student(array)
  when "0"
    array.each do |student|
      puts student
      puts ". . . ."
    end
    sleep(5)
  end
end

def create_student(id)
  student = Service_students.new(id)
end

def view_student(array)
  system("clear")
  print "Please enter the ID of the student you with to view.\n> "
  id_student_to_view = gets.chomp.to_i
  puts "looking for the student wit the ID #{id_student_to_view}"

  array.each { |student|
    if student.id == id_student_to_view
      10.times { print ". . . ." }

      puts student
      puts student.name
      10.times { print ". . . ." }
    end
  }
end

# --------------------------------------------------------------------
# ? MAIN
puts "Welcome to the Student registry, we save their information, usernames, IDs and passwords."
sleep(5)

id = 1
continue = true
array = []

begin
  system("clear")

  # first menu to add at least one student.
  unless id > 1
    puts "id : #{id}"
    array << ini_program(id)
  else

    # menu when theres more than one student.
    if id > 1
      cont_program(id, array)
    end
  end

  id += 1
end while continue
