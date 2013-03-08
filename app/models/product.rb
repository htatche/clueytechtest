class Product < ActiveRecord::Base
  attr_accessible :category_id, :name, :price, :code

  belongs_to :category
  has_many :orders
end
