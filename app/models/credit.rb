class Credit
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :add_number, :building, :phone_num, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :add_number, presence: true
  validates :phone_num, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, add_number: add_number, phone_num: phone_num,
                   building: building, order_id: order.id)
  end
end
