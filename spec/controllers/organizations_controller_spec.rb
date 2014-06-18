require 'spec_helper'

describe OrganizationsController do

  describe 'GET #show' do
    it 'assigns the requested organization to @organization' do
      organization = create(:organization)
      get :show, id: organization
      expect(assigns(:organization)).to eq organization
    end
  end

  describe 'GET #new' do
    it 'assigns a new organization to @organization' do
      get :new
      expect(assigns(:organization)).to be_a_new(Organization)
    end
  end

  describe 'POST #create' do
    context 'with VALID attributes' do
      it 'saves the new organization in the database' do
      end
    end
    context 'with INVALID attributes' do
      it 'does NOT save the new organization in the database' do
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested organization to @organization' do
    end
  end

  describe 'PUT #update' do
    context 'with VALID attributes' do
      it 'changes the attributes of an organization' do
      end
    end
    context 'with INVALID attributes' do
      it 'does NOT change the attributes of an organization' do
      end
    end
  end

end
