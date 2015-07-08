require 'sunlight-congress'
require 'rubygems'
require 'csv'



Sunlight::Congress.api_key = "28ec1945859a4502a1477f6e42d8e36e"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	name = row[:first_name]
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
	zipcode = clean_zipcode(row[:zipcode])
	puts "#{name} - #{zipcode} - #{legislators}"
end