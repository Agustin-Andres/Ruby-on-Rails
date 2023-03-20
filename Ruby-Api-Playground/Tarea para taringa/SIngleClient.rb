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

#update an existing client
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

#
def create_client(name)
  url = URI("https://www.cloud.wispro.co/api/v1/clients?name=#{name}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Post.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "f124388a-43bb-4059-a605-f54453a3d4d1"
  request.body = {
    'email': "Agustin.avellaneda20@gmail.com",
    'phone': "2614676938",
  }.to_json

  response = http.request(request)
  puts response.read_body
end

def filter_by_name()
  url = URI("https://www.cloud.wispro.co/api/v1/clients/")
  params = {
    name_unaccent_cont: "agustin",
    national_identification_number_eq: "42422422",
  }
  url.query = URI.encode_www_form(params)

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["Accept"] = "application/json"
  request["Authorization"] = "f124388a-43bb-4059-a605-f54453a3d4d1"

  response = http.request(request)
  response = JSON.parse(response.body)
  pp response
end

#update_client("7501d2e7-9382-4117-8af0-3894481d49ea")

#get_single_client("7501d2e7-9382-4117-8af0-3894481d49ea")
20.times { print "- - - - " }
puts
#create_client("cliente API 1 ")
#get_single_client("ebac08b6-2361-4c3f-b587-47a683852e44")

filter_by_name
