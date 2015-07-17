require 'spec_helper'

describe CGI::QueryString do
	it 'has a version number' do
		expect(CGI::QueryString::VERSION).not_to be nil
	end
	
	describe "#param" do
		it 'does basic param encoding' do
			str = CGI::QueryString.param({
				:a => 1
			})
			expect(str).to eq("a=1")
		end

		it 'does advanced param encoding' do
			str = CGI::QueryString.param({
				:a => 1,
				:b => {
					:c => [1,2,3]
				},
				:d => [4,5,6]
			})
			expect(str).to eq("a=1&b%5Bc%5D%5B%5D=1&b%5Bc%5D%5B%5D=2&b%5Bc%5D%5B%5D=3&d%5B%5D=4&d%5B%5D=5&d%5B%5D=6")
		end	
	end
end
