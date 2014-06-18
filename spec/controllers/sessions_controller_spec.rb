require 'spec_helper'

describe SessionsController do

  describe 'GET #donors_login' do
    it 'renders the donors_login template' do
      get :donors_login
      expect(:response).to render_template(:donors_login)
    end
  end

  describe 'POST #donors_create' do
    context 'with VALID login' do
      it 'saves the donor id to session[:donor_id]' do
        donor = create(:donor)
        post :donors_create, email: donor.email, password: donor.password
        expect(session[:donor_id]).to eq donor.id
      end
    end
    context 'with INVALID login' do
      it 'does NOT save the donor id to session[:donor_id]' do
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
      end
    end
    context 'with INVALID login' do
      it 'does NOT save the organization id to session[:organization_id]' do
      end
    end
  end

  describe 'GET #logout' do
    it 'resets the session' do
    end

    it 'redirects to the homepage' do
    end
  end

end
