require 'spec_helper'

describe ApplicationHelper do
  describe "#bootstrap_class_for(flash_type)" do
    it "should return 'alert-block' for :alert" do
      helper.bootstrap_class_for(:alert).should == "alert-block"
    end

    it "should return 'alert-error' for :error" do
      helper.bootstrap_class_for(:error).should == "alert-error"
    end

    it "should return 'alert-info' for :notice" do
      helper.bootstrap_class_for(:notice).should == "alert-info"
    end

    it "should return 'alert-info' for :success" do
      helper.bootstrap_class_for(:success).should == "alert-success"
    end

    it "should return param as string when it isn't alert, error, notice or success" do
      helper.bootstrap_class_for(:other).should == "other"
    end
  end
end
