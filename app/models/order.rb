class Order
  include Mongoid::Document
  field :subtotal, type: Float
  field :tax, type: Integer
  field :shipping, type: Integer
  field :total, type: Integer
  field :order_date, type: Date
  field :order_status_id, type: Integer
  field :stripe_id, type: String
  before_create :set_order_status
  before_save :update_subtotal
  belongs_to :order_status
  has_many :order_items, dependent: :destroy
  belongs_to :buyer





  def subtotal
    order_items.collect { |oi| oi.valid? ? ((oi.quantity * oi.unit_price) + (oi.quantity * oi.ship_cost)) : 0 }.sum.round(2)
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
