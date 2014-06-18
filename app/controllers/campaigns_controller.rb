class CampaignsController < ApplicationController
  before_action :set_campaign, only:[:edit, :show, :update]
  before_action :set_organization, only:[]

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    campaign = Campaign.new(campaign_params)
    if campaign.save
      redirect_to campaign_path(campaign)
    else
      flash[:alert] = "Problem creating new campaign."
      render 'new'
    end
  end

  def edit
    # this page has both campaign information & requested items/pledges information
    # Organization can edit campaign name & desc but have to click edit items to get
    # to edit request page.
    @pledges = @campaign.pledges
    @requests = @campaign.requests
  end

  def show
    if donor_logged_in?
      @pledges = @campaign.pledges.where(donor_id: current_donor)
      @requests = @campaign.requests
    else
      session[:campaign_id] = params[:id] #
      flash[:alert] = "Please log in"
      redirect_to donors_login_path
    end
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
    params.require(:campaign).permit(:organization_id, :name, :description, :start_date, :end_date)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The Campaign you were looking for could not be found."
  end
end
