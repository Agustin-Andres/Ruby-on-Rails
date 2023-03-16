require "uri"
require "net/http"
require "openssl"
require "pp"
require "json"

def get_all_data(page)
  url = URI("https://www.cloud.wispro.co/api/v1/invoicing/invoices?page=" + page.to_s + "&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "f124388a-43bb-4059-a605-f54453a3d4d1"

  response = http.request(request)
  JSON.parse(response.body)
end

def get_all_invoices_array(current_page, all_invoices)

  #get the amount of contracts available
  total_invoices = get_all_data(current_page)["meta"]["pagination"]["total_records"]

  # get the total pages
  total_pages = get_all_data(current_page)["meta"]["pagination"]["total_pages"]

  puts "Total pages: #{total_pages}\t\t Current page : #{current_page}"

  #we get all invoices in current page
  all_invoices_in_current_page = get_all_data(current_page)["data"]

  # each invoice is an item in an array, this item has an array with all the transactions.
  all_invoices_in_current_page.each do |invoice|
    all_invoices << invoice
  end

  if current_page == total_pages
    return all_invoices
  else
    current_page = current_page + 1
    get_all_invoices_array(current_page, all_invoices)
  end
end

all_invoices = []
all_invoices = get_all_invoices_array(1, all_invoices)

all_invoices.each do |invoice|
  puts
  puts invoice[]
  puts
  20.times { print "- - - -" }
end


