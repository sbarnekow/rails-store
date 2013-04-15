require 'open-uri'
require 'uri'

class Product < ActiveRecord::Base
  attr_accessible :name, :price, :reviews, :body, :in_cart, :image
  has_many :reviews

validates_uniqueness_of :name, :message => "This product name has been taken."
validates_presence_of :name, :message => "No product name entered."
validates_presence_of :price, :message => "Must enter price."
end
