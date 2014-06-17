require 'spec_helper'

describe Request do

	context "it belongs to campaign" do 
		it { should belong_to(:campaign) }
	end	

	context "it belongs to item" do 
		it { should belong_to(:item) }
	end

	context "it has many pledges" do 
		it { should have_many(:pledges) }
	end

end

