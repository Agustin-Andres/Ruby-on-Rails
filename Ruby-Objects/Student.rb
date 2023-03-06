# ! This is the first script creatged while studying objects.
# ¿ This is the creation of an object, the class' first letter has to be capitalized. This is a blue print containing
# ¿ varibales, methods and information in those variables
class Student
  # + here we have instance variables belonging to this class.
  @first_name
  @last_name

  # ? Here we have the methods beloging to this class we can call upon.
  # + by default the "to_s" method will print whatever we asign to it when we call the raw class.
  def to_s
    "First name: #{@first_name}"
  end
end

# ----------------------------------------------------------------------
agustin = Student.new
puts agustin
