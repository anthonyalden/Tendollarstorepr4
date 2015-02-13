require 'rails_helper'

RSpec.describe SellersController, :type => :controller do

describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
      
    end
  end

  describe "GET #show" do
  
    it "returns http success code for sellers show action" do
      seller = FactoryGirl.build(:seller, :username => "talden")
      get :show, :id => seller.id
      expect(response).to have_http_status(:success)
    end

    it "renders the seller show view" do
      seller = FactoryGirl.build(:seller, :username => "talden")
      get :show, :id => seller.id
      expect(response).to render_template("show")
    end

    it "shows the user" do
      seller = FactoryGirl.build(:seller, :username => "talden")
      get :show, :id => seller.id
      expect(assigns(:seller)).to match(seller)
    end
  end

end