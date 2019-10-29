require "rspec"
require "benchmark"
require './combination'

class CombinationTest
	obj = Combination.new
	describe "Check input number" do
		it "should not be null" do
			str = ""
			op = (str.length == 0)
			expect(op).to be_truthy
		end
		it 'should be 10 digits long' do 
			str = "2857935333"
			op = obj.total_length(str)
			expect(op).to be_truthy
		end

		it 'should not include 0 or 1' do
			str = "2857935310"
			op = obj.zero_or_one(str)
			expect(op).to be_truthy
		end 
	end

		describe "Check  dictionary file" do
		it "should be exist" do
			op = obj.file_exist?(obj.file_path)
			expect(op).to be_truthy
		end

	end

end