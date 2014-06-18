require 'spec_helper'

describe Request do

  context "it belongs to campaign" do
    it { should belong_to(:campaign) }
  end

end
