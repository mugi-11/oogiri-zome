class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  has_many :like, dependent: :destroy
  has_many :likes
  has_many :users, through: :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  validates :user_id, presence: true
  validates :answer, presence: true
end
