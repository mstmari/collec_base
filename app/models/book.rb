class Book < ApplicationRecord
  has_many :user_books
  has_many :users, :through => :user_books

  validates :title, presence: true
  validates :author, presence: true

    # accepts_nested_attributes_for :user_books
    binding.pry
  def user_book_attributes=(i, user_book_attribute)
     binding.pry
    raise user_books_attributes.inspect
	   user_books_attributes.each do |book_attribute|
	      self.user_books.build(book_attribute)
     end
   end

end
