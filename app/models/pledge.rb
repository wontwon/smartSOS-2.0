class Pledge < ActiveRecord::Base
  belongs_to :donor
  belongs_to :request
end
