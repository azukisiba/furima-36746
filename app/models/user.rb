class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kanji_name_first, presence: true
  validates :kanji_name_last, presence: true
  validates :kana_name_first, presence: true
  validates :kana_name_last, presence: true
  validates :birth_date, presence: true
end
