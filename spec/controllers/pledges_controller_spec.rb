require 'spec_helper'

describe PledgesController do

  let!(:item) {create :item}
  let!(:campaign) {create :campaign}
  let!(:donor) {create :donor}

  describe 'GET #list_donor_pledges' do
    it "assigns to @pledges all of the requested donor's pledges" do
      pledge1 = Pledge.create(donor_id: donor.id, campaign_id: campaign.id, item_id: item.id, quantity: 5)
      pledge2 = Pledge.create(donor_id: donor.id, campaign_id: campaign.id, item_id: item.id, quantity: 6)
      get :list_donor_pledges, donor_id: donor.id
      expect(assigns(:pledges)).to eq [pledge1, pledge2]
    end

    it "renders a list_donor_pledges page" do
      get :list_donor_pledges, donor_id: donor.id
    end
  end

  describe 'POST #create_pledges' do
    it "creates a batch of pledges"
  end

end
