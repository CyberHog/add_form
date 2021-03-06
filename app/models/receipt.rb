class Receipt < ApplicationRecord
  belongs_to :patients_receipt, optional: true
  has_many :menus, dependent: :nullify

  enum payment_method: { 現金: 0, カード: 1, クーポン: 2, ポイント: 3 }

  validates :payday, :payment_method, :service, :payment, :payee, presence: true
  validates :payment, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
