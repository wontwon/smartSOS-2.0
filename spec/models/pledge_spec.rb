require 'spec_helper'

describe Pledge do
	context "it should belong to donor" do
		it { should belong_to(:donor) }
	end

	context "it should belong to request" do
		it { should belong_to(:request) }
	end
end

