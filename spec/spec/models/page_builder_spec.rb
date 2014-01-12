require "spec_helper"

describe Dust::Builder::Page do

  before :each do
    @page = FactoryGirl.build(:page)
    @builder = Dust::Builder::Page.new(
      :page => @page
    )
  end

  it "should create a starter block" do
    @builder.save
    @page.blocks.first.should be_an_instance_of Dust::Block
  end

end
