require 'spec_helper'

describe Pledge do
  context "it should belong to donor" do
    it { should belong_to(:donor) }
  end

  context "it should belong to campaign" do
    it { should belong_to(:campaign) }
  end

  context "it should belong to item" do
    it { should belong_to(:pledged_item) }
  end

end
