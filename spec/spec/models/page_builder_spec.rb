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

  it "should add sections to a page" do
    pending
    section_attr = {:sections => [
      [0, {
        :title => Faker::Lorem.sentence(3),
        :classes => Faker::Lorem.sentence(2),
        :_destroy => "0"
      }]
    ]}

    builder = Dust::Builder::Page.new(
      :page => @page,
      :sections => section_attr
    )

    builder.save
    puts @page.sections
  end

end
