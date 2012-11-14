require 'spec_helper'

describe "Display items" do
  describe "GET /" do
    let!(:items) { create_list(:item, 5)}

    before do
      visit root_path
    end

    it "should display the current items (title and borrower)" do
      within('table') do
        items.each do |item|
          page.should have_content(item.title)
          page.should have_content(item.borrower.name)
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

    it "should display a 'Add item' button" do
      page.should have_link('Add item')
    end
  end
end
