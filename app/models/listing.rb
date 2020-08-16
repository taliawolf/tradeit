class Listing < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  validates :title, presence: true
  has_many_attached :photos
  has_many :offers, dependent: :destroy
end
