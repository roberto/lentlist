require 'spec_helper'

describe Item do
  it { should validate_presence_of(:title) }
end
