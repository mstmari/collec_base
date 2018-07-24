class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :condition
  validates_presence_of :description
  validates_presence_of :price

  def self.most_valuble
    self.order(price: :desc).limit(1)
  end

end
