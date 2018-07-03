class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.most_valuble
    self.order(price: :desc).limit(1)
  end


end
