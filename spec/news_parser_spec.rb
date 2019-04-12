require "rspec"
require_relative "../app/httparty"

describe ParserNews do 
  let(:parser) {ParserNews.country_news('us')}
  	it 'create instance of class ParserNews' do
  		expect(parser).to be_an_instance_of(ParserNews)
  	end
		it 'response in varible_data' do 
			expect(parser.var).not_to eq(nil)
		end
		it 'save response to file' do
			parser.save_file
			expect(File.exist? 'ResponseFile.json').to eq(true )
		end
end	