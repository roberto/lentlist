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

require 'spec_helper'

describe Item do
  it { should validate_presence_of(:title) }
end
