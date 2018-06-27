class User < ApplicationRecord
  has_secure_password

  has_many :user_books
  has_many :books, :through => :user_books

  validates :name, presence: true
  validates :password, length: { in: 6..20 }

  

  # or use #accepts_nested_attributes_for :book


end
