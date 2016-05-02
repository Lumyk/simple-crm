class Production < ActiveRecord::Base
  validates :prodact_id,:count,:status, presence: true
end
