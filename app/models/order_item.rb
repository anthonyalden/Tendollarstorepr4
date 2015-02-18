class OrderItem
  include Mongoid::Document
  field :unit_price, type: Float
  field :quantity, type: Integer
  field :shipping_cost, type: Float
  field :seller, type: String
  # field :total_price, type: Integer
  belongs_to :item
  belongs_to :order
  belongs_to :seller
  before_save :finalize
  accepts_nested_attributes_for :item


  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  # validate :item_present
  validate :order_present

  def unit_price
    # item.price
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def total_price
    unit_price * quantity + shipping_cost
  end

  def ship_cost
    item.shipping_cost
  end

  private
  def item_present
    if self[:item].nil?
      errors.add(:item, "is not valid or is not active.")
    end
  end

  def order_present
    if self.order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:shipping_cost] = ship_cost
    self[:total_price] = quantity * self[:unit_price]
    self[:total_price] = self[:total_price]+ self[:shipping_cost]
    self[:seller] = item.seller.username
    self[:seller_id] = item.seller._id
  end


end
