class Theme < ApplicationRecord

  belongs_to :admin, optional: true

  validates :theme, presence: true
end
