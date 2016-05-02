class Prodact < ActiveRecord::Base
  validates :name,:color_id,:model_id, presence: true

end
