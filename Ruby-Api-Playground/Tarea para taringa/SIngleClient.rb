require "uri"
require "net/http"
require "openssl"
require "pp"
require "json"

#gets single client by UUID
def get_single_client(uuid)
  url = URI("https://www.cloud.wispro.co/api/v1/clients/#{uuid}") # ! 7501d2e7-9382-4117-8af0-3894481d49ea - ID de agustin avellaneda Jetcom-connected

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "f124388a-43bb-4059-a605-f54453a3d4d1"

  response = http.request(request)
  response = JSON.parse(response.body)
  pp response
end

def update_client(uuid)
  url = URI("https://www.cloud.wispro.co/api/v1/clients/#{uuid}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Put.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "f124388a-43bb-4059-a605-f54453a3d4d1"
  request.body = {
    "name": "Agustin Andres Avellaneda",
    'email': "Agustin.avellaneda20@gmail.com",
    'phone': "2614676938",
  }.to_json

  response = http.request(request)
  updated_client = JSON.parse(response.body)
  puts updated_client
end

update_client("7501d2e7-9382-4117-8af0-3894481d49ea")

get_single_client("7501d2e7-9382-4117-8af0-3894481d49ea")
20.times { print "- - - - " }
puts
