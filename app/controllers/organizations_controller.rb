class OrganizationController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update]

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      session[:organization_id] = @organization.id
      redirect to organization_path(@organization)
    else
      flash.now.alert = "Apologies. Your Organization has not been registered."
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :street, :city, :state, :zipcode, :email, :phone, :description, :password, :password_confirmation, :url)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.now.alert = "The Organization you were looking for could not be found."
  end

end
