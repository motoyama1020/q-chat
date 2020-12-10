class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  with_options format: { with: /\A[0-9]+\z/ }, on: :update, allow_nil: true do
    validates :event_time, numericality: { greater_than_or_equal_to: 1 }
    validates :clear_time, numericality: { greater_than_or_equal_to: 0 }
  end

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_one_attached :image


  def was_attached?
    image.attached?
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
