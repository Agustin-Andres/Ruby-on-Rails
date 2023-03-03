# ! Main script to call upon the methods from the clients.
# ¿ requirements
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
# + pretty print
require_relative 'get_clients'
require_relative 'filter_clients'

def choice_by_user(choice)
  choice = choice.to_i
  puts "Choice : #{choice} and its class : #{choice.class}"
  case choice
  when 1
    puts 'Entered choice 1'
    display_all_clients
  when 2
    search_by_public_id
  end
end

# * methods for the menu
# ? Choice 1 to show all clients neatly.
def display_all_clients
  display_data_legibly
end

# ? Choice 2 search for a client by their public ID.
def search_by_public_id
  print "Please enter the public ID of the client you wish to search for.\n> "
  client_public_id = gets.chomp

  if !client_public_id.is_a?(Integer)
    return_client_by_id(client_public_id)
  else
    search_by_public_id
  end
end

# ! ----------------------------------------------------------------------------------------------
continue = true
10.times { print '- - - - - - - - - ' }
puts "\n➥ Welcome to the client API from wispro."

begin
  # + we first tell the client the options they have for this program
  5.times { print '_____________' }
  puts "\n➥ This is the main menu where you can choose what you want to do to your clients."
  5.times { print '_____________' }
  puts "\n➝ 1 : Show all clients from the system"
  puts '➝ 2 : Search for a specific client'
  puts '➝ 3 : Update specific client'
  puts '➝ 4 : Delete specific client '
  print "➝ 5: Quit\n> "

  # + now we get an answer on what they want to do.
  answer_choice = gets.chomp
  choice_by_user(answer_choice)
end while (continue)
