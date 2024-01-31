class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :pickup_address, :drop_address, :description, :contact, :pickup_date, :client_name, presence: true
  validate :pickup_date_cannot_be_in_the_past

  private

  def pickup_date_cannot_be_in_the_past
    return unless pickup_date.present? && pickup_date < Date.today

    errors.add(:pickup_date, "Date can't be in the past")
  end
end
