class User < ApplicationRecord
  has_secure_password
  has_many :user_books
  has_many :books, :through => :user_books

  validates :name, :presence => {:message => 'Name cannot be blank, User not saved'}

end
