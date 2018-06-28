class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :price, presence: true
  validates :condition, presence: true


end
