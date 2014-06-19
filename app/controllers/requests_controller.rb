class RequestsController < ApplicationController
before_action :set_campaign, only: [:edit, :new, :destroy]
before_action :set_request, only: [:destroy]
before_action :logged_in?

  def new
    @organization = @campaign.organization
    @items = Item.all
    @total_requests_price = @campaign.total_requests_price
  end

  def create
    request_quantity = request_params[:quantity]
    item_id = request_params[:item_id]
    campaign_id = request_params[:campaign_id]

    if request_for_item_exists(item_id, campaign_id)
      update_existing_request(item_id, campaign_id, request_quantity)
      redirect_to new_campaign_request_path(campaign_id)
    else
      save_new_request
      redirect_to new_campaign_request_path(campaign_id)
    end
  end

  # def edit
  #   @request = Request.find(params[:id])
  # end

  # def update
  #   @request = Request.find(params[:id])
  #   if @request.update_attributes(request_params)
  #     flash[:success] = "Request updated successfully"
  #     render :edit
  #   else
  #     flash[:alert] = @request.errors.fulL_messages
  #     render :edit
  #   end
  # end

  def destroy
    if @request.destroy
      flash[:alert] = "Success. Your Request has been removed."
      redirect_to  new_campaign_request_path(@campaign)
    else
      flash[:alert] = "Something went terribly wrong. Request not destroyed."
      render :new
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

  def set_request
    @request = Request.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The request you were looking for could not be found."
  end

  def logged_in?
    unless organization_logged_in?
      redirect_to organizations_login_path
    end
  end

  def request_for_item_exists(item_id, campaign_id)
    Request.where(item_id: item_id).where(campaign_id: campaign_id).any?
  end

  def update_existing_request(item_id, campaign_id, request_quantity)
    existing_request = Request.where(item_id: item_id).where(campaign_id: campaign_id).first
    new_request_quantity = existing_request.quantity + request_quantity.to_i
    existing_request.update_attribute('quantity', new_request_quantity)
  end

  def save_new_request
    request = Request.new(request_params)
    if request.save
      flash[:success] = "Item added"
    else
      flash[:alert] = "#{@request.errors.full_messages}"
    end
  end
end
