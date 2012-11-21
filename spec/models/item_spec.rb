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

  describe "#archive" do
    before(:each) { Timecop.freeze }
    after(:each)  { Timecop.return }

    context "not archived item" do
      let(:item)    { create(:item) }

      it "sets archived_at date" do
        item.archive
        reloaded_item = Item.find(item)
        expect(reloaded_item.archived_at).to be_same_time_as(Time.now)
      end
    end

    context "archived item" do
      let(:item)    { create(:archived_item) }

      it "doesn't change archived_at date" do
        expect { item.archive }.to_not change{ Item.find(item).archived_at }
      end
    end
  end
end
