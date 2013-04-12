class Product < ActiveRecord::Base
  attr_accessible :name, :price, :review, :body, :in_cart, :image

  has_many :reviews
end
