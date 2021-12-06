class Flat < ApplicationRecord
  validates :name, :address, :description, :price_per_night, :number_of_guests, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
