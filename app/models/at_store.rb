class AtStore < ActiveRecord::Base
  validates :prodact_id,:store_id,:count, presence: true
end
