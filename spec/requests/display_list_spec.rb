require 'spec_helper'

describe "DisplayList" do
  describe "GET /" do
    let(:items) { FactoryGirl.create_list(:item, 5)}

    before do
      visit root_path
    end

    it "should display the current items (title and borrower)" do
      within('table') do
        items.each do |item|
          page.should have_content(item.title)
          page.should have_content(item.borrower)
        end
      end
    end

    it "should display edit, delete and archive button for each item" do
      all(:xpath, "//tbody/tr").each do |element|
        element.should have_link('Edit')
        element.should have_link('Archive')
        element.should have_link('Delete')
      end
    end
  end
end
