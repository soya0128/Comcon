class Email < ApplicationRecord
  validates :subject, presence: true
  validates :content, presence: true

  belongs_to :user
end
