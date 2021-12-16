class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  validates :user_id, presence: true
  validates :answer, presence: true
end
