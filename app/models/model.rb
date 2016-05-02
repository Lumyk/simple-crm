class Model < ActiveRecord::Base
  validates :name, presence: true
end
