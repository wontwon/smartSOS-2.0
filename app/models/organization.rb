class Organization < ActiveRecord::Base
  has_secure_password
  has_many :campaigns

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true, length: { is: 5 }
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :phone, presence: true
  validates :description, presence: true
  validates :url, presence: true
end
