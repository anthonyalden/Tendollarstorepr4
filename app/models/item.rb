class Item
  include Mongoid::Document
  field :price, type: Float
  field :item_tag, type: String
  field :description, type: String
  field :shipping_cost, type: Float
  field :active, type: Mongoid::Boolean
  validates_numericality_of :price, less_than_or_equal_to: 10.00, message: "Item Price Must be $10 or Less"
  belongs_to :seller
  has_many :order_items
  accepts_nested_attributes_for :order_items
  
  # scope :active_item, -> {where(active: true)}

  mount_uploader :image, AvatarUploader

  validates :price, presence: true
  validates :item_tag, presence: true#. message: "Item Must Vave a Value Entered."
  validates :description, presence: true#, message: "Description Must Have a Value Entered."
  validates_numericality_of :shipping_cost, greater_than_or_equal_to: 0#, message: "Shipping Cost cannot be less than Zero Dollars"
  validates :shipping_cost, presence: true
end
