require 'spec_helper'

describe Campaign do
	context "it should belong to organization" do
		it { should belong_to(:organization) }
	end

	context "it should have many requests" do
		it { should have_many(:requests) }
	end

	context "it should have many pledges" do
		it { should have_many(:pledges).through(:requests) }
	end
end

