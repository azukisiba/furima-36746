class Credit
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :area_id, :city, :number, :building, :phone_num, :order
  
  validates :user, presence: true
  validates :item, presence: true
  validates :postal_code, presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :number, presence: true
  validates :building, presence: true
  validates :phone_num, presence: true
  validates :order, presence: true

  def save
    Order.create(user: user, item: item)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, phone_num: phone_num, building: building)
  end
end