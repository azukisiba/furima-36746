class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/ } do
    validates :kanji_name_first
    validates :kanji_name_last
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :kana_name_first
    validates :kana_name_last
  end

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items
end
