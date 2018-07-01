class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def UserBook::most_valuble
    binding.pry
    self.order(value: :desc).limit(1)
  end


end
