class Menu < ApplicationRecord
  belongs_to :clinic, optional: true
  belongs_to :receipt, optional: true

  validates :content_id, presence: true,
		numericality: { only_integer: true,
		greater_than: 0, allow_blank: true},
		uniqueness: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :attached_point, presence: true,
  		numericality: { only_integer: true,
  			allow_blank: true }
end
