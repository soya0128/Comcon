class Member < ApplicationRecord

  validates :postal_code, presence: true, format:{with:/\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true, numericality: {other_than: 1, message: "を選択してください"}
  validates :address, presence: true
  validates :phone_number, presence: true, format:{with:/\A[0-9]{10,11}\z/}
  validates :part_id, presence: true, numericality: {other_than: 1, message: "を選択してください"}

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :part
    belongs_to :prefecture
end