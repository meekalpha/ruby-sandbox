require "bubble_sort"

describe "bubble sort" do 
	it "correctly sorts an array" do
		bubble_sort([4,3,78,2,0,2]).should == [0,2,2,3,4,78]
	end
end
describe "bubble sort by" do
	it "recieves a block of code and sorts accordingly" do
		bubble_sort_by(["hi","hello","hey"]) {|left,right| right.length - left.length}
	end
end