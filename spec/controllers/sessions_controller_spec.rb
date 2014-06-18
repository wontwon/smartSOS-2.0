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
    end
    context 'with INVALID login' do
    end
  end

  describe 'GET #organizations_login' do
    it 'renders the organizations_login template' do
      get :organizations_login
      expect(:response).to render_template(:organizations_login)
    end
  end

  describe 'POST #organizations_create' do
  end

  describe 'GET #logout' do
  end

end
