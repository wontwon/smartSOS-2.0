class Pledge < ActiveRecord::Base
  belongs_to :donor
  belongs_to :request

  def campaign
    self.request.campaign
  end

  def item
    self.request.item
  end
end
