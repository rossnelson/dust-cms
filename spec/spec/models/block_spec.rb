require "spec_helper"

describe Dust::Block do
  before:each do 
    @page = FactoryGirl.build(:page)
    builder = Dust::Builder::Page.new(
      :page => @page
    )
    builder.save
    @block = @page.blocks[0]
  end

  context ".grid" do

    it "should be an ostruct" do
      Dust::Block.grid.should be_an_instance_of OpenStruct
    end

    describe ".columns" do
      it "should be a multidimensional array" do
        Dust::Block.grid.columns.should be_an_instance_of Array
        Dust::Block.grid.columns[0].should be_an_instance_of Array
      end
    end

    describe ".offsets" do
      it "should be a multidimensional array" do
        Dust::Block.grid.offsets.should be_an_instance_of Array
        Dust::Block.grid.offsets[0].should be_an_instance_of Array
      end
    end

  end

  describe ".regions" do
    it "should be a multidemensional array" do
      3.times do 
        @page.sections << FactoryGirl.create(:section)
      end
      Dust::Block.regions.should be_an_instance_of Array
    end
    it "of titles and region slugs" do
      Dust::Block.regions[0].should be_an_instance_of Array
      Dust::Block.regions[0][0].should == "Header One"
      Dust::Block.regions[0][1].should == "header-one"
    end
  end

  describe ".find_active" do
    it "should find all blocks for a given url" do
      3.times do; FactoryGirl.create(:block); end

      block = Dust::Block.all[1]
      url   = block.show.split("\r\n").first

      Dust::Block.find_active(url).count.should == 1
    end
  end

  describe ".widget_list" do
    
  end

  describe "#final_classes" do
    
  end

  describe "#pages" do
    it "should return an array of pages" do
      @block.pages[0].should be_an_instance_of Dust::Page
    end
  end

  describe "#show_me?" do
    it "should return true if url is in url_list" do
      block = FactoryGirl.create(:block)
      url   = block.url_list.first
      block.show_me?(url).should == true
    end

    it "should return false when url is not included" do
      block = FactoryGirl.create(:block)
      url = "/wibble"
      block.show_me?(url).should == false
    end

    it "should return true if the url is / and the urlList contains the Dust .config.root" do
      block = FactoryGirl.create(:block)
      block.url_list << "/welcome"
      block.show_me?("/")
    end
  end

  describe "#url_list" do
    it "should split each line into an arry of urls" do
      block = FactoryGirl.create(:block)
      block.url_list.should == block.show.split("\r\n")
    end
  end



  
end
