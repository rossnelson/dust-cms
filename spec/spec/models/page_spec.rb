require 'spec_helper'

describe Dust::Page do

  before :each do 
    @factory = FactoryGirl.create(:page) 
  end

  it "has a valid factory" do 
    @factory.should be_valid
  end

  it "should posess an array of blocks" do
    @factory.blocks.should be_an_instance_of Array
  end

end

