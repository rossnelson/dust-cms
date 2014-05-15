require "spec_helper"

describe Dust do

  before :each do
    Dust::Seed.data
  end

  describe "#site_wides" do
    it "should be an ostruct with nested categories and items" do
      Dust.site_wides.should be_an_instance_of OpenStruct
      Dust.site_wides.should respond_to :contact_info
      Dust.site_wides.contact_info.should respond_to :default_recipient
    end
  end

  describe "#default_recipient" do
    it "should return the relative site_wide value" do
      Dust.default_recipient.should be_an_instance_of String
      Dust.default_recipient.should == "admin@dust.com"
    end
  end

  describe "#root" do
    it "should be the path to the gem root" do
      path = Pathname.new(File.expand_path("../../../../", __FILE__))
      Dust.root.should == path
    end
  end

  describe "#configure" do
    it "should accept a block and return the config object" do
      config = Dust.configure{ |dust| dust.config.root = 'welcome' }

      Dust.config.root.should be_an_instance_of String
      Dust.config.root.should == "welcome"
    end
  end

end
