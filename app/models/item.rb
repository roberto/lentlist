class Item < ActiveRecord::Base
  attr_accessible :borrower, :title

  validates_presence_of :title

end
