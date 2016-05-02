class Sklad < ActiveRecord::Base
  validates :prodact_id, :count, presence: true
end
