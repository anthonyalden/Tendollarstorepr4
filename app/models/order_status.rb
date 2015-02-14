class OrderStatus
  include Mongoid::Document
  field :status, type: String
  has_many :Orders
end
