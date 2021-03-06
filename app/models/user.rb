class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_answers, through: :likes, source: :answer
  
  validates :nickname, presence: true
  validates :email, presence: true

end
