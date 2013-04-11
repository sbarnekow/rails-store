class Product < ActiveRecord::Base
  attr_accessible :name, :price, :review

  has_many :reviews
end
