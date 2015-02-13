require 'rails_helper'

RSpec.describe Item, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:item)).to be_valid
  end

  it "has a valid price" do
    item = FactoryGirl.build(:item, :price => "10.00")
    expect(item).to respond_to(:price)
    expect(item).to be_valid
  end

  it "has a invalid price over $10.00" do
    item = FactoryGirl.build(:item, :price => "11.00")
    expect(item).to respond_to(:price)
    expect(item).to be_invalid
  end

  it "does not have a price" do
    item = FactoryGirl.build(:item, :price => nil)
    expect(item).to respond_to(:price)
    expect(item).to be_invalid
  end

  it "does not have an item_tag" do
    item = FactoryGirl.build(:item, :item_tag => nil)
    expect(item).to respond_to(:item_tag)
    expect(item).to be_invalid
  end

  it "does have an item_tag" do
    item = FactoryGirl.build(:item, :item_tag => "iPhone")
    expect(item).to respond_to(:item_tag)
    expect(item).to be_valid
  end

  it "does not have a description" do
    item = FactoryGirl.build(:item, :description => nil)
    expect(item).to respond_to(:description)
    expect(item).to be_invalid
  end

  it "does have a description" do
    item = FactoryGirl.build(:item, :description => "Color is red")
    expect(item).to respond_to(:description)
    expect(item).to be_valid
  end

  it "does have price greater than or equal to 0" do
    item = FactoryGirl.build(:item, :shipping_cost => 0.00)
    expect(item).to respond_to(:shipping_cost)
    expect(item).to be_valid
  end

  it "does note have a price greater than or equal to 0" do
    item = FactoryGirl.build(:item, :shipping_cost => -1)
    expect(item).to respond_to(:shipping_cost)
    expect(item).to be_invalid
  end


end