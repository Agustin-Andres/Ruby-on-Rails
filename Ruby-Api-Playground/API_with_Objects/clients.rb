# ! This script "Clients" is to interact with the API. HTTP requests (GET, POST, PUT,DELETE)
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
# + pretty print
require 'pp'

# ?Get all clients REQUEST
def get_clients_per_page(page)
  url = URI('https://www.cloud.wispro.co/api/v1/clients?page=' + page.to_s + '&per_page=100')

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request['accept'] = 'application/json'

  request['Authorization'] = '2f9fa2fd-23a4-4f2c-beac-1a1093563a31' # ! currently in HEY
  # ! jetcom - 9a80b05c-c42a-417c-b58b-37f3db55d818
  response = http.request(request)

  # ¿ parsing the response from a string to a Hash to separate the diferent values (status, meta, data )
  JSON.parse(response.body)
end
def get_all_clients()
  # + there will always be at least one page.
  current_page = 1
  total_amount_of_clients = get_clients_per_page(current_page)['meta']['pagination']['total_records']
  total_clients_array = [[1], []]

  total_clients_array.each do |page, array_returned|
    puts "Currently in page #{page} current page: #{current_page}"
    puts
    puts
    total_clients_array[current_page][1] = get_clients_per_page(current_page)["data"].to_a
    current_page = current_page + 1
  end




get_all_clients()
