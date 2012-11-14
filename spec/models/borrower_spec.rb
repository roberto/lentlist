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

require 'spec_helper'

describe Borrower do
  it "has a valid factory" do
    expect(create(:borrower)).to be_valid
  end
  it "is invalid without name"do
    expect(build(:borrower, name: "")).to_not be_valid
  end
  it "is valid without email"do
    expect(build(:borrower, email: "")).to be_valid
  end
  it { should accept_values_for(:email, "ale.x+test@example.com.br", nil, "john@example.com", "lambda@gusiev.com") }
  it { should_not accept_values_for(:email, "invalid", "a@b", "john@.com") }
end
