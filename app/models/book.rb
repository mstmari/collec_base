class Book < ApplicationRecord
  has_many :user_books
  has_many :users, :through => :user_books

  validates :title, presence: true
  validates :author, presence: true

  accepts_nested_attributes_for :user_books

  # def user_book_attributes=(book_attributes)
  #   binding.pry
	#    book_attributes.each do |book_attribute|
	#       self.books.build(book_attribute)
  #    end
  

end
