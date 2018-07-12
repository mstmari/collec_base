class User < ApplicationRecord
  has_secure_password

  has_many :user_books
  has_many :books, :through => :user_books

  validates :name, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }

    def self.is_admin?
      self.admin
    end

end
