require 'httparty'

class News #posing some news with query
	include HTTParty
	API_KEY = '882e10dd2b474a23bb7a3efa85e66b61' 

	base_uri 'newsapi.org'
	def self.inputCountry(country_name)
		new(country_name)
	end

  def initialize(country_name)
    @options = { query: { country: country_name, apiKey: API_KEY} }
 		countryNews
  end

  def countryNews
    response = self.class.get("/v2/top-headlines", @options).parsed_response
    print_formated_json(response)
  end

  private

  def print_formated_json(response)
  	f = File.new('responseFile.json', 'a')
  	f.write(JSON.pretty_generate(response))
  	puts JSON.pretty_generate(response)
  end
end

News.inputCountry('US')


