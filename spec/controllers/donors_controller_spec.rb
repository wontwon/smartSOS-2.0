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

		context "with valid attributes" do 
			it "saves the new donor in the database" do 
				expect{
					post :create, donor: attributes_for(:donor)
			}.to change(Donor, :count).by(1)
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


