# ! This is the first script creatged while studying objects.
# ¿ This is the creation of an object, the class' first letter has to be capitalized. This is a blue print containing
# ¿ varibales, methods and information in those variables
class Student
  # ¿ we can use attr_accessor to get and set all the identities (instance variables) of the class:
  attr_accessor :first_name, :last_name, :email, :hobby
  # ¿ attr_reader only allows us to read the identity (instance variables)
  attr_reader :id
  # ! if we make an identity readable only - we have to set it. we often do this in INITIALIZE

  def initialize(first_name, last_name, email, hobby)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @hobby = hobby
    @id = "1"
  end

  # ? Here we have the methods beloging to this class we can call upon.
  # ? these are getters
  # def first_name()
  #   @first_name
  # end
  #
  # def last_name()
  #   @last_name
  # end
  #
  # # ? these are setters,
  # def first_name=(first_name)
  #   @first_name = first_name
  # end
  #
  # def last_name=(last_name)
  #   @last_name = last_name
  # end

  # + by default the "to_s" method will print whatever we asign to it when we call the raw class.
  def to_s
    " First name: #{@first_name}\n Last name: #{@last_name}\n Email: #{@email}\n Hobby: #{@hobby}\n ID: #{@id}"
  end
end

# ----------------------------------------------------------------------

print "Enter the first name \n> "
first_name = gets.chomp.to_s
print "Enter the last name \n> "
last_name = gets.chomp.to_s
print "Enter the email \n> "
email = gets.chomp.to_s
print "Enter the students hobby \n> "
hobby = gets.chomp.to_s

agustin = Student.new(first_name, last_name, email, hobby)

20.times { print ". . . . . . " }
puts
puts agustin
