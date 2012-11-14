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
  it "has a valid factory" do
    expect(create(:item)).to be_valid
  end
  it "is invalid without title"do
    expect(build(:item, title: "")).to_not be_valid
  end
end
