class Buyer
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :addr1, type: String
  field :addr2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :phone, type: String
  field :email, type: String
  validates :first_name, presence: true#, message: "First Name Must Have a Value Entered."
  validates :last_name, presence: true#, message: "Last Name Must Have a Value Entered."
  validates :addr1, presence: true
  validates :city, presence: true
  validates :state, presence: true, format: {with: /[A-Z]{2}/i}
  validates :zip, presence: true, format: {with: /[0-9]{5}/}
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :phone, presence: true, format: {with: /\(?([0-9]{3})\)?[-]?([0-9]{3})[-]?([0-9]{4})/}#,message: "Phone Must Have a Value Entered in the Format 999-999-9999."

  has_many :orders

end
