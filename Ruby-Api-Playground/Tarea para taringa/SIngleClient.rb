require "uri"
require "net/http"
require "openssl"
require "pp"
require "json"
require "httparty"

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
  api_key = "f124388a-43bb-4059-a605-f54453a3d4d1"
  api_url = "https://api.cloud.wispro.co/v1/clients/#{uuid}"

  response = HTTParty.put(api_url, {
    headers: {
      "Authorization" => "Bearer #{api_key}",
      "Content-Type" => "application/json",
    },
    body: {
      name: "Agustin andres Avellaneda",
      email: "agustin.avellaneda20@gmail.com",
      phone: "1234567890",
    }.to_json,
  })

  if response.success?
    puts "Client updated successfully!"
  else
    puts "Error updating client: #{response.code} - #{response.body}"
  end
end

get_single_client("7501d2e7-9382-4117-8af0-3894481d49ea")
20.times { print "- - - - " }
puts
update_client("7501d2e7-9382-4117-8af0-3894481d49ea")
