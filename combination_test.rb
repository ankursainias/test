require "rspec"
require "benchmark"
require './combination'

class CombinationTest

	describe "Check input number" do
		it "should be worng" do
			str = "1323533"
			op = Combination.new.valid?(str)
			expect(op).to be_falsey
		end
	end

		describe "Check input number" do
		it "should be right" do
			str = "8877335498"
			op = Combination.new.valid?(str)
			expect(op).to be_truthy
		end
	end

end