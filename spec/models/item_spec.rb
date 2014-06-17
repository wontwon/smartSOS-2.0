require 'spec_helper'

describe Item do 
	context "it should have many requests" do
		it { should have_many(:requests) }
	end
end