class RequestsController < ApplicationController
  def new
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
  end

  def update
  end

  private

  def request_params
    params.require(:request).permit(:campaign_id, :item_id, :quantity)
  end


end
