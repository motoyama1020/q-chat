class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :capacity
  belongs_to_active_hash :month
  belongs_to_active_hash :year

  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :year_id
    validates :month_id
    validates :prefecture_id
    validates :capacity_id
  end

  def self.search(search)
    if search != ''
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
