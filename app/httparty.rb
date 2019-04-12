require 'httparty'

class ParserNews #posing some news with query
	include HTTParty
	API_KEY = '882e10dd2b474a23bb7a3efa85e66b61' 

  attr_reader :var

	base_uri 'newsapi.org'
	def self.country_news(country_name)
		new(country_name).country_news
	end

  def initialize(country_name)
    @options = { query: { country: country_name, apiKey: API_KEY} }
  end

  def country_news
    response = self.class.get("/v2/top-headlines", @options).parsed_response
    #print_formated_json(response)
    #save_file(response)
    @var = response
    self
  end

  def print_formated_json 	
  	puts JSON.pretty_generate
  end

  def save_file
    f = File.new('ResponseFile.json', 'a')
    f.write(JSON.pretty_generate(var))
  end

end

  test1 = ParserNews.country_news('US')
  p test1.var
  test1.save_file