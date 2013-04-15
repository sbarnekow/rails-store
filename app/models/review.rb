class Review < ActiveRecord::Base
  attr_accessible :body, :product_id, :rating, :product
  belongs_to :product 

  validates_length_of :body, :minimum => 50, :maximum => 1000, :message => "Review must be between 50 and 1000 characters." 
  validates_inclusion_of :rating, :in => 0..5, 
  :message => "Rating must be of values 0-5, 0 being the lowest, 5 being the highest."
end
 