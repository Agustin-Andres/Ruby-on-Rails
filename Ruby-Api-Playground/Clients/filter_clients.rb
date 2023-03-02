require "uri"
require "net/http"
require "openssl"
require "json"
# + pretty print
require "pp"
require_relative 'get_clients.rb'

=begin
 ¿ this is the structure of the json received per client

{"id"=>"b3067049-d0d1-4ea8-96f4-4683232e8c5e",
 "public_id"=>103,
 "custom_id"=>"",
 "name"=>"JOHN JAIRO CARDENAS ORREGO",
 "email"=>"fotosjohncardenas@gmail.com",
 "password"=>nil,
 "address"=>"Vereda Chicarron",
 "phone"=>"",
 "phone_mobile"=>"+573188717480",
 "phone_mobile_verified"=>true,
 "national_identification_number"=>"71658679",
 "city"=>"Bello",
 "state"=>"Antioquia",
 "details"=>"",
 "collector_id"=>nil,
 "seller_id"=>nil,
 "neighborhood_id"=>nil,
 "created_at"=>"2021-04-06T08:55:12.148-05:00",
 "updated_at"=>"2021-06-08T12:02:40.683-05:00",
 "link_mobile_login"=>
  "https://cloud.wispro.co/portal_api/auth/6cWxeJrT027B_vRnhqHFMg"}

=end

def display_one_item_from_array(array)
  print "How would you like to filter the clients?\n> "
  data_searched = gets.chomp

  array.select do |client|
    client.each do |item|
      if item.to_s == data_searched
        pp client
      end
    end
  end

end







# !----------------------------------------------------------------------------------------------------------------------

all_clients_raw_data = get_all_clients()
#display_one_item_from_array

