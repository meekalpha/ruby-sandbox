require "stock_picker"

describe "stock picker" do 
	it "is correct when max is after min" do
		answer = stock_picker([7,2,6,9,15,8,6,5,10])
		answer.length.should == 2
		answer[0].should == 1
		answer[1].should == 4
	end
	it "is correct when min is after max" do
		answer = stock_picker([7,3,19,9,15,8,6,1,10])
		answer.length.should == 2
		answer[0].should == 1
		answer[1].should == 2
	end
	it "choose 1st when every day is the same" do
		answer = stock_picker([5,5,5,5,5,5,5,5,5])
		answer.length.should == 2
		answer[0].should == 0
		answer[1].should == 1
	end
	it "is correct when min is final day" do
		answer = stock_picker([7,2,6,9,15,8,6,5,1])
		answer.length.should == 2
		answer[0].should == 1
		answer[1].should == 4
	end
	it "is correct when max is first day" do
		answer = stock_picker([17,2,6,9,15,8,6,5,10])
		answer.length.should == 2
		answer[0].should == 1
		answer[1].should == 4
	end
end