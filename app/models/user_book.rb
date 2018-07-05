class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.most_valuble
    self.order(price: :desc).limit(1)
  end


  def self.find_user_book(id)
    binding.pry
    self.find_by(book_id: id)
  end
end
