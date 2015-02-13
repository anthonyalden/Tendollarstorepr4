FactoryGirl.define do
  factory :order do
    order_num "123456"
    order_date "2015 01 05"
    seller_id "00001"
    first_name "Tony"
    last_name "Alden"
    addr1 "123 First Street"
    addr2 "Apt 4"
    city "Los Angeles"
    state "CA"
    zip "90064"
  end
end
