class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:edit, :show, :update]
  before_action :logged_in?, only: [:show, :new, :create, :edit, :update]

  def index
    @campaigns = Campaign.all
  end

  def show
    @pledges = @campaign.pledges
    @requests = @campaign.requests
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.new(organization_id: session[:organization_id] ,
                            name: campaign_params[:name],
                            description: campaign_params[:description])

    if campaign.save
      flash[:success] = "Your campaign has been created."
      redirect_to organization_path(session[:organization_id])
    else
      flash[:alert] = "Problem creating new campaign."
      render 'new'
    end
  end

  def edit
    @pledges = @campaign.pledges
    @requests = @campaign.requests
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = "#{@campaign.errors.full_messages}"
      render 'edit'
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:name, :description, :end_date)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Campaign you were looking for could not be found."
  end

  def logged_in?
    unless organization_logged_in?
      flash[:alert] = "Please log in"
      redirect_to organizations_login_path
    end
  end

end
