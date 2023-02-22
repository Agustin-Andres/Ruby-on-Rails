require "uri"
require "net/http"
require "openssl"
require "json"

#?Methods
#Returns the whole unparsed data from get clients
def getUnparsedData()
  url = URI("https://www.cloud.wispro.co/api/v1/clients?page=1&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "9a80b05c-c42a-417c-b58b-37f3db55d818"

  response = http.request(request)

  #parsing the response from a string to a Hash to separate the diferent values (status, meta, data )
  parsedHash = JSON.parse(response.body)

  return parsedHash
end

#Returns the info from pagination
def paginationData(pagination_request)
  if pagination_request == "amountOfClients"
    return getUnparsedData()["meta"]["pagination"]["total_records"]
  elsif pagination_request == "amountOfPages"
    return getUnparsedData()["meta"]["pagination"]["total_pages"]
  elsif pagination_request == "currentPage"
    return getUnparsedData()["meta"]["pagination"]["current_page"]
  else
    return nil
  end
end

totalClients = paginationData(amountOfClients)

=begin
data = unparsedData["data"]

for client in data
  puts client[""]
end
=end
