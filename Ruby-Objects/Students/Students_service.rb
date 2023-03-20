require_relative "Student_object.rb"
require "bcrypt"

class Service_students
  attr_accessor :first_name, :last_name, :email
  attr_writer :password
  attr_reader :id

  def initialize(id)
    @first_name = set_first_name()
    @last_name = set_last_name()
    @email = set_email()
    @password = BCrypt::Password.create(set_password)
    @id = id

    student = Student.new(@first_name, @last_name, @email, @password, @id)
    return student
  end

  def edit_student()
    continue = false
    loop do
      10.times { print ". . . . . " }
      puts
      puts "1 - Edit first name\n2 - Edit last name\n3 - Edit email or edit password\n4 - Print Student\n5 - exit"
      print "Enter what you wish to edit: "
      option_selected = gets.chomp.to_s
      puts
      10.times { print ". . . . . " }
      puts
      case option_selected
      when "1"
        puts "Editing first name"
        @first_name = set_first_name
      when "2"
        puts "Editing last name"
        @last_name = set_last_name
      when "3"
        puts "Editing email address or password"
        verify_password
      when "4"
        to_s
      when "5"
        puts "exiting"
        continue = true
      else
        puts "Please enter a valid option"
      end

      break if continue
    end
  end

  # + edtiting password
  def verify_password()
    print "\nPlease enter your password :"
    entered_password = gets.chomp.to_s
    original_password = BCrypt::Password.new(@password)

    puts "original_password = #{original_password} and its class = #{original_password.class}"
    puts "entered_password = #{entered_password} and its class = #{entered_password.class}"

    if original_password == "123"
      puts "original_password = #{original_password} and 123 class = #{"123".class}"
    end

    if entered_password.to_s == original_password.to_s
      puts "Successfully entered your password.\n Change email or password or both?"
      answer = gets.chomp.to_s
      if answer.include?("both")
        @email = set_email
        @password = set_password
      elsif answer.include?("email")
        @email = set_email
      else
        @password = set_password
      end
    else
      puts "Invalid password"
    end
  end

  #Setters
  def set_first_name()
    print "First name : "
    return gets.chomp.to_s
  end

  def set_last_name()
    print "Last name : "
    return gets.chomp.to_s
  end

  def set_email()
    print "Enter your Email : "
    return gets.chomp.to_s
  end

  def set_password()
    print "Enter a password : "
    password = gets.chomp
    puts "Retype password : "
    verification = gets.chomp.to_s

    if verification == password
      return password.to_s
    else
      set_password()
    end
  end

  def to_s
    puts " -First name: #{@first_name}\n -Last name: #{@last_name}\n -Email: #{@email}\n -ID: #{@id}\n pass:#{@password}"
  end
end
