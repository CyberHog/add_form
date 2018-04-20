class User < ApplicationRecord
  has_one :patient, dependent: :nullify
  accepts_nested_attributes_for :patient
  has_one :clinic, dependent: :nullify
  accepts_nested_attributes_for :clinic

  validates :name, length: { maximum: 20}
end
