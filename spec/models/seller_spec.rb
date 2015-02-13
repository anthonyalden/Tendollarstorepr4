require 'rails_helper'

RSpec.describe Seller, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:seller)).to be_valid
  end

# ============== users name validation tests ==============
  it "has a invalid username" do
    seller = FactoryGirl.build(:seller, :username => nil)
    expect(seller).to respond_to(:username)
    expect(seller).to be_invalid
    # expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end
  it "has a valid username" do
    seller = FactoryGirl.build(:seller)
    expect(seller).to respond_to(:username)
    expect(seller.username).to eq("tbalden")
  end

  it "has a invalid password" do
    seller = FactoryGirl.build(:seller, :password => "123")
    expect(seller).to respond_to(:password)
    expect(seller).to be_invalid
  end

  it "has a password" do
    seller = FactoryGirl.build(:seller, :password => "123456")
    expect(seller).to respond_to(:password)
    expect(seller).to be_valid
  end

  it "does not have a last name" do
    seller = FactoryGirl.build(:seller, :last_name => nil)
    expect(seller).to respond_to(:last_name)
    expect(seller).to be_invalid
  end

  it "has a last name" do
    seller = FactoryGirl.build(:seller, :last_name => "Alden")
    expect(seller).to respond_to(:last_name)
    expect(seller).to be_valid
  end

  it "does not have a first name" do
    seller = FactoryGirl.build(:seller, :first_name => nil)
    expect(seller).to respond_to(:first_name)
    expect(seller).to be_invalid
  end

  it "has a last name" do
    seller = FactoryGirl.build(:seller, :first_name => "Alden")
    expect(seller).to respond_to(:first_name)
    expect(seller).to be_valid
  end

  it "does not have a phone" do
    seller = FactoryGirl.build(:seller, :phone => nil)
    expect(seller).to respond_to(:last_name)
    expect(seller).to be_invalid
  end

  it "does not have a phone" do
    seller = FactoryGirl.build(:seller, :phone => nil)
    expect(seller).to respond_to(:last_name)
    expect(seller).to be_invalid
  end

  it "has a valid phone" do
    seller = FactoryGirl.build(:seller, :phone => "123-123-4567")
    expect(seller).to respond_to(:last_name)
    expect(seller).to be_valid
  end

  it "does not have a valid phone" do
    seller = FactoryGirl.build(:seller, :phone => "123-1-4567")
    expect(seller).to respond_to(:last_name)
    expect(seller).to be_invalid
  end

  it "does not have an email" do
    seller = FactoryGirl.build(:seller, :email => nil)
    expect(seller).to respond_to(:email)
    expect(seller).to be_invalid
  end

  it "does have a valid email format" do
    seller = FactoryGirl.build(:seller, :email => "Alden@example.com")
    expect(seller).to respond_to(:email)
    expect(seller).to be_valid
  end

  it "does not have a valid email format" do
    seller = FactoryGirl.build(:seller, :email => "Aldenexample.com")
    expect(seller).to respond_to(:email)
    expect(seller).to be_invalid
  end

end



