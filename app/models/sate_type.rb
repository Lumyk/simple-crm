class SateType < ActiveRecord::Base
  validates :name, presence: true
end
