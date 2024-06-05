class OrderForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line1, :address_line2, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :city, :address_line1
    validates :user_id, :item_id
    validates :postal_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/, message: "is invalid. Enter 10 or 11 digits."}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
   purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end