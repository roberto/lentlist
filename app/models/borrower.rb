# == Schema Information
#
# Table name: borrowers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Borrower < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :items

  validates_presence_of :name
  validates_email_format_of :email, :allow_blank => true
end
