class User < ApplicationRecord
  has_secure_password
  has_many :user_books
  has_many :books, :through => :user_books

  validates presence_of :name
  validates :name, presence: true

end
