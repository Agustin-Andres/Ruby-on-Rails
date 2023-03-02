require "uri"
require "net/http"
require "openssl"
require "json"
# + pretty print
require "pp"

# ? Returns the whole unparsed data from get clients
# ¿ the unparsed raw is all the same, returns a hash containing hashes: -status -meta -data
# + status is if it was successful (200) || meta returns the metadata - both hashes (object and pagination,) || data contains hashes, each hash a client from the current page in pagination.
def get_unparsed_data(page)
  url = URI("https://www.cloud.wispro.co/api/v1/clients?page=" + page.to_s + "&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"

  request["Authorization"] = "9a80b05c-c42a-417c-b58b-37f3db55d818"
  # ! jetcom -    "2f9fa2fd-23a4-4f2c-beac-1a1093563a31" # ! currently in HEY
  response = http.request(request)

  # ¿ parsing the response from a string to a Hash to separate the diferent values (status, meta, data )
  JSON.parse(response.body)
end

# ? we obtain the metadata from the API request - specifically the pagination.
# ¿ this method obtains the amount of clients, pages and current page in the system- returns the pagination request-
# ¿ wheather that be the ammount of clients, total pages or current page  - returns just one
def paginationData(pagination_request, page)
  unparsed_data = get_unparsed_data(page)
  # + we clear redundency with pagination, returning the hash containing total records- total pages - current page.
  pagination = unparsed_data["meta"]["pagination"]

  case pagination_request
  when "amount_of_clients"
    pagination["total_records"]
  when "amount_of_pages"
    pagination["total_pages"]
  when "current_page"
    pagination["current_page"]
  end
end

# ? we get all the clients in the page given.
# ¿ this method receives the page - and returns all the clients in the page given.
def client_data(page)
  get_unparsed_data(page)["data"]
end

# ? we display any hash given here.
# ¿ this method displays a hash/array containing HASHES, returns the object hash inside a hash or array.
def display_hash(hash)
  hash.each do |h|
    print h
    20.times { print ". . . ." }
  end
end

# ? we display the total amount of records in its RAW format.
# ¿ we receive an array containing ALL the clients. - has to receive the total clients ARRAY
def display_raw_clients(total_clients_array)
  # + i to
  i = 0

  20.times { print "- - - - - " }
  puts "\n\t\tDisplaying all the clients in their raw form:\n"
  20.times { print "- - - - - " }

  total_clients_array.each do |clients|
    clients.each do |client|
      puts "\n\t\t\t------------> #{client["public_id"]} <------------"
      pp client # * we pretty print the client so the array is displayed legibly and readable.
      20.times { print "________________" }
      i += 1
    end
  end
end

# ? We GET ALL the clients.
# ¿ this method calls all the methods above. this method returns all the clients in RAW format (class: array) -""total_clients_array""
def get_all_clients()
  # + there will always be at least one page.
  current_page = 1
  total_clients_array = [].to_a

  # + we begin a loop to get the total ammount of clients
  begin
    #  puts "\n  current_page: #{current_page}"
    # + we get the total ammount of pages in the system
    total_pages = paginationData("amount_of_pages", current_page)

    # + we check how many clients are in the system.
    total_clients = paginationData("amount_of_clients", current_page)

    # + we our current page.
    current_page = current_page + 1

    # + we have to get ALL the clients in one array, we call the function per page and concat it to the array "total_clients_array"
    total_clients_array << client_data(current_page)
  end while (total_pages != current_page)

  puts "\tData received:\n> Total clients: #{total_clients}\t||\t Total pages: #{total_pages}"
  return total_clients_array
end


# !----------------------------------------------------------------------------------------------------------------------

# ? dispays all the clients
display_raw_clients(get_all_clients)
# !----------------------------------------------------------------------------------------------------------------------
