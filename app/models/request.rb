class Request < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :item
  has_many :pledges
  validates :quantity, numericality: { greater_than: 0 }
end
