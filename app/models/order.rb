class OrderNum
  include Mongoid::Document
  field :order_num, type: String
  field :order_date, type: String
  field :seller_id, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :addr1, type: String
  field :addr2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  belongs_to :seller
  
end
