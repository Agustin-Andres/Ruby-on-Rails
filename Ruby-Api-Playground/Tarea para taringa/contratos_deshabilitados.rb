require "uri"
require "net/http"
require "openssl"
require "json"
# + pretty print
# Traer todos los contratos deshabilitados de wispro office en estado deshabilitados y colocar el UUID en un array.

# metodo para obtener todos los contratos por pagina.
def get_all_data(page)


  url = URI("https://www.cloud.wispro.co/api/v1/contracts?page=" + page.to_s + "&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "ceaed881-f38f-471e-a382-a76c8cc4299d" # Wispro office Token

  response = http.request(request) #This is a class Net::HTTPOK

  # this will parse the request from a class Net::HTTPOK to a class HASH
  JSON.parse(response.body)

  #puts response.read_body  # if we wished to print out the response. (remember the data is from the page given to the method.)
end

# we get all the info and sort it.
def display_all_disabled_contracts(current_page)

  #get the amount of contracts available
  total_contracts = get_all_data(current_page)["meta"]["pagination"]["total_records"]

  # get the total pages
  total_pages = get_all_data(current_page)["meta"]["pagination"]["total_pages"]

  #puts "Total pages: #{total_pages}\t\t Current page _: #{current_page}"

  #we get all contracts in current page
  all_contracts_in_current_page = get_all_data(current_page)["data"]

  #we initialize an array to store the UUID of all the disabled contracts
  disabled_contracts_id = []

  # + iteration on all the clients on the current page.
  all_contracts_in_current_page.each do |contract|
    #pp contract          # - if we wish to print every contract being analyzed

    # unless to filter out the disabled contracts and append it to the array
    unless contract["state"] == "enabled"
      disabled_contracts_id << contract["id"]
    end
  end

  #  iteration to call the same method on the nex page until the current page == the total number of pages, when its false, it returns the completed array
  if current_page != total_pages
    disabled_contracts_id << display_all_disabled_contracts(current_page + 1)
  else
    return disabled_contracts_id
  end
end

#--------------------------------------------------------------------------------------------------------------------------------
# MAIN

# we call upon the method to display all the disabled contracts.
amount_of_disbaled_contracts = display_all_disabled_contracts(1)

#we print
20.times { print "- - - - - " }
puts
puts "UUID of all disabled contracts:"
amount_of_disbaled_contracts.each do |id|
  puts id
end
