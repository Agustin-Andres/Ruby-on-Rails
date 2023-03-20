# ! This is the first script creatged while studying objects.
# ¿ This is the creation of an object, the class' first letter has to be capitalized. This is a blue print containing
# ¿ varibales, methods and information in those variables
class Student
  # ¿ we can use attr_accessor to get and set all the identities (instance variables) of the class:
  attr_accessor :first_name, :last_name, :email, :hobby

  # + here we have instance variables belonging to this class.
  @first_name
  @last_name
  @email
  @hobby

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
    "First name: #{@first_name}\n Last name: #{@last_name}"
  end
end

# ----------------------------------------------------------------------
agustin = Student.new
print "Enter the first name \n> "
first_name = gets.chomp.to_s
print "Enter the last name \n> "
last_name = gets.chomp.to_s

agustin.first_name = first_name
agustin.last_name = last_name

20.times { print ". . . . . . " }
puts
puts agustin.first_name
puts agustin.last_name
