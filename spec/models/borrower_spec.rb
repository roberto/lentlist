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
  it { should validate_presence_of(:name) }
  it { should_not validate_presence_of(:email) }
  it { should accept_values_for(:email, "ale.x+test@example.com.br", "john@example.com", "lambda@gusiev.com") }
  it { should_not accept_values_for(:email, "invalid", "a@b", "john@.com") }
end
