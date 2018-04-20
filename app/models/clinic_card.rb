class ClinicCard < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :patient, optional: true

  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
