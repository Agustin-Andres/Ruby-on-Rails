require "bcrypt"

class Student
  attr_accessor :first_name, :last_name, :email
  attr_writer :password
  attr_reader :id

  def initialize(first_name, last_name, email, password, id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
    @id = id
  end

  def to_s
    puts " -First name: #{@first_name}\n -Last name: #{@last_name}\n -Email: #{@email}\n -ID: #{@id}"
  end
end
