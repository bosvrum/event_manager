require 'csv'
require 'sunlight/congress'
# export PATH=/usr/local/bin:$PATH
Sunlight::Congress.api_key = "28ec1945859a4502a1477f6e42d8e36e"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
end