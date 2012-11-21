

RSpec::Matchers.define :be_same_time_as do |expected|
  match do |actual|
    expected.utc.to_s == actual.utc.to_s
  end
end
