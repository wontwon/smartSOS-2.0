require 'spec_helper'

describe CampaignsController do
  let(:campaign) { create :campaign}
  let(:donor) { create :donor }
  let(:item) { create :item }
  let(:request) { create :request }
  let(:organization) { create :organization }

  describe 'GET #index' do
    it 'assigns all campaigns to @campaigns' do
      campaign2 = create(:campaign)
      get :index
      expect(assigns(:campaigns)).to match_array([campaign, campaign2])
    end
  end

  describe 'GET #new' do
    it 'assign a new instance of Campaign to @campaign' do
      get :new
      expect(assigns(:campaign)).to be_a Campaign
    end
  end

  describe 'POST #create' do
    let!(:campaign) { create :campaign }

    it 'with valid attributes' do
      expect{
        post :create, campaign: attributes_for(:campaign)
        }.to change(Campaign, :count).by(1)
    end

    it 'with invalid attributes' do
      expect{
        post :create, campaign: attributes_for(:invalid_campaign)
        }.to_not change(Campaign, :count)
    end
  end

  describe 'GET #edit' do
    it 'assigns @campaign to requested record of Campaign' do
      get :edit, id: campaign.id
      expect(assigns(:campaign)).to eq campaign
    end

    it 'renders edit page' do
      get :edit, id: campaign.id
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do

    context "when donor is logged in" do
      it 'assigns @pledges to an array of donor pledges for that campaign' do
        session[:donor_id] = donor.id
        pledge1 = Pledge.create(donor_id: donor.id, request_id: request.id, quantity: 5)
        pledge2 = Pledge.create(donor_id: donor.id, request_id: request.id, quantity: 5)
        get :show, id: request.campaign
        expect(assigns(:pledges)).to eq [pledge1, pledge2]
      end

      it 'assigns @requests to an array of campaign requests' do
        session[:donor_id] = donor.id
        get :show, id: request.campaign
        expect(assigns(:requests)).to eq [request]
      end
    end

    context "when organization is logged in" do
      it 'assigns @pledges to an array of all pledges made to that campaign' do
        session[:organization_id] = organization.id
        request1 = Request.create(campaign_id: campaign.id, item_id: item.id, quantity: 5)
        pledge1 = Pledge.create(donor_id: donor.id, request_id: request1.id, quantity: 5)
        pledge2 = Pledge.create(donor_id: donor.id, request_id: request1.id, quantity: 5)
        session[:organization] = organization.id
        get :show, id: request1.campaign
        expect(assigns(:pledges)).to eq [pledge1, pledge2]
      end

      it 'assigns @requests to an array of campaign requests' do
        session[:organization_id] = organization.id
        session[:donor_id] = donor.id
        get :show, id: request.campaign
        expect(assigns(:requests)).to eq [request]
      end
    end

    context "when neither organization or donor is logged in" do
      it 'redirects to the donors login page' do
        get :show, id: campaign
        expect(response).to redirect_to donors_login_path
      end
    end
  end

  describe 'POST #update' do
    it 'with valid attributes' do
      patch :update, id: campaign, campaign: attributes_for(:campaign, name: 'Edited Campaign Name')
      campaign.reload
      expect(campaign.name).to eq('Edited Campaign Name')
    end

    it 'with invalid attributes' do
      patch :update, id: campaign, campaign: attributes_for(:campaign, name: '')
      expect(response).to render_template :edit
    end
  end

end
