class Service < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :min_cost, presence: true, numericality: { greater_than: 0 }
end
