class Listing < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  validates :title, presence: true
end
