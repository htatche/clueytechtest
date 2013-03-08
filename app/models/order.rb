class Order < ActiveRecord::Base
  attr_accessible :date, :location_id, :product_id, :quantity, :terminal_id

  belongs_to :product
  belongs_to :location
  belongs_to :terminal
end
