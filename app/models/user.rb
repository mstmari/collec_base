class User < ApplicationRecord
  has_secure_password

  has_many :user_books
  has_many :books, :through => :user_books

  validates :name, presence: true
  validates :password, length: { in: 6..20 }

  # def user_book_attributes=(book_attributes)
	#    book_attributes.each do |book_attribute|
	#       self.books.build(book_attribute)
  #    end
  # end


end
