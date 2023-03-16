require 'uri'
require 'net/http'
require 'openssl'
require 'pp'
require "json"

def get_all_invoice_data(page)

  url = URI("https://www.cloud.wispro.co/api/v1/invoicing/invoices?page=" + page.to_s + "&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = 'f124388a-43bb-4059-a605-f54453a3d4d1'

  response = http.request(request)
  #puts response.read_body

 # this will parse the request from a class Net::HTTPOK to a class HASH
 JSON.parse(response.body)
end

def sort_invoices(current_page)

  #get the amount of invoices available
  total_invoices = get_all_invoice_data(current_page)["meta"]["pagination"]["total_records"]

  # get the total pages
  total_pages = get_all_invoice_data(current_page)["meta"]["pagination"]["total_pages"]

  #puts "Total pages: #{total_pages}\t\t Current page _: #{current_page}"

  #we get all invoices in current page
  all_invoices_in_current_page = get_all_invoice_data(current_page)["data"]

  #we initialize an array to store the UUID of all the disabled invoices
  invoices = []

  # + iteration on all the clients on the current page.
  all_invoices_in_current_page.each do |invoice|
    #pp invoice          # - if we wish to print every invoice being analyzed

    invoices << invoice
    end
end

all_invoices = sort_invoices(all_invoices)

all_invoices.each do |invoice|
  pp  invoice
end
