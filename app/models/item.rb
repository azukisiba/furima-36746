class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :area
  belongs_to :delivery

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :states_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :load_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" } 
end
