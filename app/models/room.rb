class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  def self.search(search)
    if search != ""
      Room.where('name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
