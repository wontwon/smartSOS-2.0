require 'spec_helper'

describe SessionsController do
  let(:campaign) { create :campaign }
  let(:donor) { create :donor }
  let(:organization) { create :organization }
  describe 'GET #donors_login' do
    it 'renders the donors_login template' do
      get :donors_login
      expect(:response).to render_template(:donors_login)
    end
  end

  describe 'POST #donors_create' do
    context 'with VALID login' do
      it 'saves the donor id to session[:donor_id]' do
        session[:campaign_id] = campaign.id
        post :donors_create, email: donor.email, password: donor.password
        expect(session[:donor_id]).to eq donor.id
      end
    end
    context 'with INVALID login' do
      it 'does NOT save the donor id to session[:donor_id]' do
        session[:campaign_id] = campaign.id
        post :donors_create, email: donor.email, password: ''
        expect(session[:donor_id]).to eq nil
      end
    end
  end

  describe 'GET #organizations_login' do
    it 'renders the organizations_login template' do
      get :organizations_login
      expect(:response).to render_template(:organizations_login)
    end
  end

  describe 'POST #organizations_create' do
    context 'with VALID login' do
      it 'saves the organization id to session[:organization_id]' do
        post :organizations_create, email: organization.email, password: organization.password
        expect(session[:organization_id]).to eq organization.id
      end
    end
    context 'with INVALID login' do
      it 'does NOT save the organization id to session[:organization_id]' do
        post :organizations_create, email: organization.email, password: ''
        expect(session[:organization_id]).to eq nil
      end
    end
  end

  describe 'GET #logout' do
    context 'logged in as donor' do
      it 'resets the session' do
        session[:donor_id] = donor.id
        get :logout
        expect(session[:donor_id]).to eq nil
      end
      it 'redirects to the homepage' do
        get :logout
        expect(response).to redirect_to root_path
      end
    end

    context 'logged in as organization' do
      it 'resets the session' do
        session[:organization_id] = organization.id
        get :logout
        expect(session[:organization_id]).to eq nil
      end
      it 'redirects to the homepage' do
        get :logout
        expect(response).to redirect_to root_path
      end
    end
  end
end
