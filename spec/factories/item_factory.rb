FactoryGirl.define do
  factory :item, class: Item do
    price "10.00"
    item_tag "iPhone"
    description "Color Red"
    shipping_cost "4.00"
  end
end