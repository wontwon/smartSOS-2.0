require 'spec_helper'

describe Donor do 
		it "is valid with a first name, lastname, email and password" do 
		donor = FactoryGirl.build(:donor)
		expect(donor).to be_valid
	end

	context "it should have many pledges" do
		it { should have_many(:pledges) }
	end
end