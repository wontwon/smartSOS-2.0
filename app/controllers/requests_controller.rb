class RequestsController < ApplicationController
before_action :set_campaign, only: [:edit, :new]

  def new
    @organization = @campaign.organization
    @request = Request.new
    @items = Item.all
  end

  def create
    @request = Request.new(request_params)

    if @request.save
      flash[:notice] = "Item added"
      redirect_to  new_campaign_request_path(params[:campaign_id])
    else
      flash[:alert] = "#{@request.errors.full_messages}"
      redirect_to  make_requests_path(@campaign.organization, @campaign)
    end
  end

  def edit
    @requests = @campaign.requests
  end

  def update
    if @request.update(request_params)
      render :edit
    else
      flash[:alert] = @request.errors.fulL_messages
      render :edit
    end
  end

  private

  def request_params
    params.require(:request).permit(:campaign_id, :item_id, :quantity)
  end

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The campaign you were looking for could not be found."
  end


end
