class Patient < ApplicationRecord
  belongs_to :user, optional: true
  has_many :clinic_cards
  has_many :clinics, through: :clinic_cards
  
end
