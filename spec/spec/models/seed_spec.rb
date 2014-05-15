require 'spec_helper'

describe Dust::Seed do
  

  describe "#page" do
    it "should return a valid Dust::page instance" do
      @page = Dust::Seed.page
      @page.should be_an_instance_of Dust::Page
      @page.id.should_not be_blank
    end
  end

  describe "#data" do
    it "should generate all seeded data" do
      @data = Dust::Seed.data

      @data["user"].should be_valid
      @data["menus"][0].should be_valid
      @data["menu_items"][0].should be_valid
      @data["page"].should be_valid
      @data["site_wides"][0].should be_valid
    end
  end

end
