require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# ? Returns the whole unparsed data from get clients
def getUnparsedData(page)
  url = URI('https://www.cloud.wispro.co/api/v1/clients?page=' + page.to_s + '&per_page=100')

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['accept'] = 'application/json'

  request['Authorization'] = '87705596-3e04-4b5e-bb7a-04fe8567fd20'
  # ! jetcom - 9a80b05c-c42a-417c-b58b-37f3db55d818
  response = http.request(request)

  # ¿ parsing the response from a string to a Hash to separate the diferent values (status, meta, data )
  JSON.parse(response.body)
end

# + we evaluate pagination to obtain the amount of clients, pages and current page in the system.
def paginationData(pagination_request, page)
  unparsed_data = getUnparsedData(page)
  # + we clear redundency with pagination, returning the hash containing total records- total pages - current page.
  pagination = unparsed_data['meta']['pagination']

  case pagination_request
  when 'amountOfClients'
    pagination['total_records']
  when 'amountOfPages'
    pagination['total_pages']
  when 'currentPage'
    pagination['current_page']
  end
end

# ? we get all the clients in the page given.
def clientData(page)
  getUnparsedData(page)['data']
end

# ? we display any hash given here.
def displayHash(hash)
  hash.each do |h|
    print h
    20.times { print '. . . .' }
  end
end

# !----------------------------------------------------------------------------------------------------------------------

# + there will always be at least one page.
totalPages = 1
totalClientsArray = [].to_a

# + we begin a loop to get the total ammount of clients
begin
  totalPages = paginationData('amountOfPages', totalPages)
  puts "total pages: #{totalPages}"

  # + we check how many clients are in the system.
  totalClients = paginationData('amountOfClients', totalPages)
  puts "Total clients: #{totalClients}"

  # + we our current page.
  currentPage = paginationData('currentPage', totalPages)
  puts "Current Page: #{currentPage}"

  # + we now need for total clients to actually have the total amount of clients.

  10.times { print '- - - - - - -' }

  # ? we have to get ALL the clients in one array, we call the function per page and concat it to the array "totalClientsArray"

  totalClientsArray << clientData(currentPage)

  # currentPage += 1 unless currentPage == totalClients
end while (totalPages != currentPage)
puts

i = 0
totalClientsArray.each do |clients|
  clients.each do |client|
    puts "\n------------>#{i}<------------"
    puts client
    10.times { print '________________' }
    i += 1
  end
end
