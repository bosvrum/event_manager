require "httparty"
require "json"
require "pp"

query_params = { 'apikey' => '28ec1945859a4502a1477f6e42d8e36e',
				 					'per_page' => 3,
		   		 				'phrase' => 'election night',
		   		 				'state' => 'MD'
		       			}

# endpoint = 'http://capitolwords.org/api/text.json'
response = HTTParty.get('http://capitolwords.org/api/text.json')

data = JSON.parse(response.body)
puts PP.pp(data, '')