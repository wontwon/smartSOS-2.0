require 'spec_helper'

describe RequestsController do
  # let(:request) { create :request }
  let!(:item) {create :item }
  let!(:campaign) { create :campaign }

  describe 'GET #new' do
    it "assigns to @items all items in db" do
      item2 = create(:item)
      get :new, campaign_id: campaign
      expect(assigns(:items)).to eq [item, item2]
    end

    it "renders new page" do
      get :new, campaign_id: campaign
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with non-zero quantity' do
      it 'saves the new request to the database' do
        expect {
          post :create, campaign_id: campaign.id,
            request: {campaign_id: campaign.id, item_id: item.id, quantity: 10}
        }.to change(Request, :count).by(1)
      end
    end

    context 'with zero quantity' do
      it 'does not save the new request to the database' do
        expect {
          post :create, organization_id: campaign.organization.id, campaign_id: campaign.id,
            request: {campaign_id: campaign.id, item_id: item.id, quantity: 0}
        }.to_not change(Request, :count)
      end
    end
  end

  describe 'GET #edit_requests' do
    it "assigns @requests to all of a campaigns' requests" do
      item1 = Item.create(asin: '1234567891', name: 'Item1', img_url: 'url', price: 1234)
      item2 = Item.create(asin: '1334567891', name: 'Item2', img_url: 'url2', price: 1234)
      request1 = Request.create(campaign_id: campaign.id, item_id: item1.id, quantity: 5)
      request2 = Request.create(campaign_id: campaign.id, item_id: item2.id, quantity: 10)

      get :edit_requests, organization_id: request1.campaign.organization, campaign_id: request1.campaign
      expect(assigns(:requests)).to eq [request1, request2]
    end
  end

  describe 'PATCH #update' do
    it "changes the quantity of a request" do
      item = Item.create(asin: '1234567891', name: 'Item1', img_url: 'url', price: 1234)
      request = Request.create(campaign_id: campaign.id, item_id: item.id, quantity: 5)
      patch :update, organization_id: request.campaign.organization, campaign_id: request.campaign, id: request.id,
        request: {quantity: 20}
      request.reload
      expect(request.quantity).to eq(20)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a request' do
      item = Item.create(asin: '1234567891', name: 'Item1', img_url: 'url', price: 1234)
      request = Request.create(campaign_id: campaign.id, item_id: item.id, quantity: 5)
      expect {
        delete :destroy, organization_id: request.campaign.organization, campaign_id: request.campaign, id: request.id
      }.to change(Request, :count).by(-1)
    end
  end

end
