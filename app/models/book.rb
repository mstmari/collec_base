class Book < ApplicationRecord
  has_many :user_books
  has_many :users, :through => :user_books

  validates :title, presence: true
  validates :author, presence: true


end
