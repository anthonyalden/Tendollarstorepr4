class Orderitemfulfill
  include Mongoid::Document
  field :unit_price, type: Float
  field :quantity, type: Integer
  field :shipping_cost, type: Float
  field :seller, type: String
end
