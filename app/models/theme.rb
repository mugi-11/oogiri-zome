class Theme < ApplicationRecord

  belongs_to :admin, optional: true
  has_many :answers, dependent: :destroy

  validates :theme, presence: true
end
