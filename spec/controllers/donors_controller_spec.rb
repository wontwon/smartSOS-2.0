require 'spec_helper'

describe DonorsController do

	describe 'GET #new' do
		it "assigns a new Donor to @donor" do
			get :new
			expect(assigns(:donor)).to be_a_new(Donor)
		end

		it "renders the :new template" do
			get :new
			expect(:response).to render_template :new
		end
	end

	describe 'POST #create' do
		let(:campaign) { create :campaign }
		context "with valid attributes" do
			it "saves the new donor in the database" do
				session[:campaign_id] = campaign.id
				expect{
					post :create, donor: attributes_for(:donor)
			}.to change(Donor, :count).by(1)
			end

			it 'saves the donor id to session[:donor_id]' do
				session[:campaign_id] = campaign.id
        post :create, donor: attributes_for(:donor)
        expect(session[:donor_id]).to eq Donor.last.id
			end

			it "redirect to new_campaign_pledge" do
				session[:campaign_id] = campaign.id
				post :create, donor: attributes_for(:donor)
				expect(response).to redirect_to new_campaign_pledge_path(session[:campaign_id])
			end

		end

		context "with invalid attributes" do
			it "does not save the new donor in the database" do
				expect {
					post :create, donor: attributes_for(:invalid_donor)
				}.to_not change(Donor, :count)
			end

			it "re-renders the :new template" do
					post :create, donor: attributes_for(:invalid_donor)
					expect(response).to render_template :new
			end
		end
	end
end


