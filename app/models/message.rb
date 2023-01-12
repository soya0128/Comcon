class Message < ApplicationRecord
  validates :message_content, presence: true, unless: :was_attached?

  belongs_to :user
  belongs_to :room
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
