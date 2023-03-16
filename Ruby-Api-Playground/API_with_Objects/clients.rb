# !
require "uri"
require "net/http"
require "openssl"
require "json"
require "pp"

require "httparty"

#! GET
# ?Get all clients REQUEST
def get_clients_per_page(page)
  url = URI("https://www.cloud.wispro.co/api/v1/clients?page=" + page.to_s + "&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"

  request["Authorization"] = "ceaed881-f38f-471e-a382-a76c8cc4299d" # ! currently in Wispro office
  # ! jetcom - 9a80b05c-c42a-417c-b58b-37f3db55d818
  response = http.request(request)

  # ¿ parsing the response from a string to a Hash to separate the diferent values (status, meta, data )
  # ¿ Remember, this returns the CURRENT PAGE with all its data
  JSON.parse(response.body)
end

# ? this method returns an array with all the clients from the ISP
def get_all_clients(current_page)
  #get the amount of clients available
  total_clients = get_clients_per_page(current_page)["meta"]["pagination"]["total_records"]
  # get the total pages
  total_pages = get_clients_per_page(current_page)["meta"]["pagination"]["total_pages"]

  #we get all clients in current page
  all_clients_in_current_page = get_clients_per_page(current_page)["data"]

  #we initialize an array to store the UUID of all the disabled contracts
  all_clients_in_array = []

  puts "\t >Total clients: #{total_clients}\t>Total pages: #{total_pages}"
  # + iteration on all the clients on the current page.
  all_clients_in_current_page.each do |client|
    #pp client          # - if we wish to print every client being analyzed
    all_clients_in_array << client
  end

  # iteration to call the same method on the next page until the current page == the total number of pages, when its false, it returns the completed array
  if current_page != total_pages
    all_clients_in_array << get_all_clients(current_page + 1)
  else
    all_clients_in_array
  end
end

# ? method to print all the clients in the array.
def print_all_clients()
  all_clients = get_all_clients(1)
  #we print
  20.times { print "- - - - - " }
  puts
  puts "\n\n\t\t All clients :"
  all_clients.each do |client|
    20.times { print "- - - " }
    puts
    pp client
    puts
  end
end

# ! PUT - updates an existing client.

# ? method to send to the ISP
def update_client()
  url = URI("https://www.cloud.wispro.co/api/v1/clients/d027d247-f21c-4595-ba96-5d245b7026b6")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Put.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "ceaed881-f38f-471e-a382-a76c8cc4299d"
  request.body = { 'name': "Agustin Andres Avellaneda",
                   'email': "Agustin.avellaneda20@gmail.com",
                   'phone': "2614676938" }.to_json
  puts request.class
  response = http.request(request)
  puts response.read_body
end

update_client
