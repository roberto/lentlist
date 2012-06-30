require 'spec_helper'

describe "DisplayList" do
  describe "GET /" do

    let(:items) { FactoryGirl.create_list(:item, 5)}

    it "should display the current list" do
      visit root_path
      within('table') do
        items.each do |item|
          page.should have_content(item.title)
          page.should have_content(item.borrower)
        end
      end
    end
  end
end
