require 'spec_helper'

describe ApplicationHelper do
  describe "#bootstrap_class_for(flash_type)" do
    it "should return 'alert-block' for :alert" do
      expect(helper.bootstrap_class_for(:alert)).to eql("alert-block")
    end

    it "should return 'alert-error' for :error" do
      expect(helper.bootstrap_class_for(:error)).to eql("alert-error")
    end

    it "should return 'alert-info' for :notice" do
      expect(helper.bootstrap_class_for(:notice)).to eql("alert-info")
    end

    it "should return 'alert-info' for :success" do
      expect(helper.bootstrap_class_for(:success)).to eql("alert-success")
    end

    it "should return flash_type if it isn't alert, error, notice or success" do
      expect(helper.bootstrap_class_for(:other)).to eql("other")
    end
  end
end
