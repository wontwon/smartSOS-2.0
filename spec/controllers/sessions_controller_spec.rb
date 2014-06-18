require 'spec_helper'

describe SessionsController do
  let(:campaign) { create :campaign }
  let(:donor) { create :donor }
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
      it 'saves the organization id to session[:organization_id]'
    end
    context 'with INVALID login' do
      it 'does NOT save the organization id to session[:organization_id]'
    end
  end

  describe 'GET #logout' do
    it 'resets the session'

    it 'redirects to the homepage'
  end

end
