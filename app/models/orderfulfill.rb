class Orderfulfill
  include Mongoid::Document
  field :order_date, type: Date
  field :order_status, type: Integer
  field :total, type: Integer
end
