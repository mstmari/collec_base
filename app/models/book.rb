class Book < ApplicationRecord
  has_many :user_books
  has_many :users, :through => :user_books

  validates :author, presence: true
  validates :title, presence: true


  accepts_nested_attributes_for :user_books, reject_if: :all_blank

  def user_book_attributes=(user_book_attributes)

      i = self.user_books.build(user_book_attributes)
      binding.pry
  end



end
