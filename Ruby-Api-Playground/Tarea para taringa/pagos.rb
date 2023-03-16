require "uri"
require "net/http"
require "openssl"
require "pp"
require "json"

def get_all_data(page)

  #https://cloud.wispro.co/api/v1/invoicing/payments?created_at_before=2023-03-08&created_at_after=2023-02-01
  url = URI("https://api.wispro.co/v1/invoicing/payments?payment_date_after=2023-02-01&payment_date_before=2023-03-01?page=" + page.to_s + "&per_page=100")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = "application/json"
  request["Authorization"] = "f23f5409-0c7d-4943-9ec4-f76fa7047f23"

  response = http.request(request)
  JSON.parse(response.body)
  puts response.body
end

def get_all_payments(current_page, all_payments)

  #get the amount of contracts available
  total_payments = get_all_data(current_page)["meta"]["pagination"]["total_records"]

  # get the total pages
  total_pages = get_all_data(current_page)["meta"]["pagination"]["total_pages"]

  puts "Total pages: #{total_pages}\t\t Current page _: #{current_page}"

  #we get all payments in current page
  all_payments_in_current_page = get_all_data(current_page)["data"]

  # each payment is an item in an array, this item has an array with all the transactions.
  all_payments_in_current_page.each do |payment|
    all_payments << payment
  end

  if current_page == total_pages
    return all_payments
  else
    current_page = current_page + 1
    get_all_payments(current_page, all_payments)
  end
end

#get all the payments to one array
all_payments = []
all_payments = get_all_payments(1, all_payments)

# initialize the selectred duplicated payments
selected_duplicated_payments = []
#have the duplicated public IDs on an array
selected_payments_public_id = ["137473", "141761", "141625", "139268", "137122", "137694", "137041"]

#iterate on the selected list of duplicated public IDs
selected_payments_public_id.each do |public_id|
  # we evaluate all payents, if the public IDs match, then we add it ti the selected_duplicated_payments arra to filter
  all_payments.each do |payment|
    if public_id == payment["public_id"].to_s
      selected_duplicated_payments << payment
    end
  end
end

selected_duplicated_payments.each do |payment|
  puts
  print "Public ID: #{payment["public_id"]}\t\t UUID: #{payment["id"]}"
  puts
  20.times { print "- - - -" }
end
