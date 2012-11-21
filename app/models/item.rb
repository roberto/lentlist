# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  borrower_id :integer
#

class Item < ActiveRecord::Base
  belongs_to :borrower

  attr_accessible :title, :borrower_attributes
  accepts_nested_attributes_for :borrower

  validates_presence_of :title

  def archive
    unless self.archived_at
      self.archived_at = Time.current
      save
    end
  end
end
