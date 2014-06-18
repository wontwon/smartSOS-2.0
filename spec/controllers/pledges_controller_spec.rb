require 'spec_helper'

describe PledgesController do

  let!(:item) {create :item}
  let!(:campaign) {create :campaign}
  let!(:donor) {create :donor}

  describe 'POST #create_pledges' do
    it "creates a batch of pledges"
  end

  describe 'GET #new' do
    # context "when donor is logged in" do
    #   it 'assigns @pledges to an array of donor pledges for that campaign' do
    #     session[:donor_id] = donor.id
    #     pledge1 = Pledge.create(donor_id: donor.id, request_id: request.id, quantity: 5)
    #     pledge2 = Pledge.create(donor_id: donor.id, request_id: request.id, quantity: 5)
    #     get :show, id: request.campaign
    #     expect(assigns(:pledges)).to eq [pledge1, pledge2]
    #   end

    #   it 'assigns @requests to an array of campaign requests' do
    #     session[:donor_id] = donor.id
    #     get :show, id: request.campaign
    #     expect(assigns(:requests)).to eq [request]
    #   end
    # end
  end

end
