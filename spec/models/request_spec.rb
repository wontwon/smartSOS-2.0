require 'spec_helper'

describe Request do

  context "it belongs to campaign" do
    it { should belong_to(:campaign) }
  end

  context "it belongs to requested item" do
    it { should belong_to(:requested_item) }
  end

end
