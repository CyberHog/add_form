class Clinic < ApplicationRecord
  belongs_to :user, optional: true
  has_many :patients, through: :clinic_cards

  validates :name, length: { maximum: 20 }
end
