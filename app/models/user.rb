class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness:{ case_sensitive: false}
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}

  has_one :member, dependent: :destroy
  has_many :payments
  has_many :emails
  has_many :storages
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
