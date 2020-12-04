class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :event_time, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 1 }
  validates :clear_time, numericality: { with: /\A[0-9]+\z/ }

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
