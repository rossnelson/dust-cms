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
    Dust::Builder::Page.new(
      :page => @page,
      :sections => FactoryGirl.build(:section_attrs)[:sections]
    ).save

    expect(@page.sections[0]).to be_an_instance_of Dust::Section
  end

  it "should remove sections marked with _destroy" do
    Dust::Builder::Page.new(
      :page => @page,
      :sections => FactoryGirl.build(:section_attrs)[:sections]
    ).save

    id = @page.sections[0].id

    section = FactoryGirl.build(:section_attrs)[:sections]
    section["1"]["_destroy"] = "1"
    section[id] = section["1"]
    section.delete("1")

    builder = Dust::Builder::Page.new(
      :page => @page,
      :sections => section
    ).update

    expect(Dust::Page.first.sections).to be_empty

  end

end
