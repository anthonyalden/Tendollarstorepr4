class Order
  include Mongoid::Document
  field :subtotal, type: Integer
  field :tax, type: Integer
  field :shipping, type: Integer
  field :total, type: Integer
  field :order_date, type: Date
  before_create :set_order_status
  before_save :update_subtotal
  belongs_to :order_status
  has_many :order_items

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end

end
