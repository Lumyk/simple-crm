class Selling < ActiveRecord::Base
  validates :prodact_id,:count,:store_id,:store_price,:my_money, presence: true
end
