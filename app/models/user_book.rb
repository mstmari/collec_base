class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of :condition
  validates_presence_of :description
  validates_presence_of :price

  def self.most_valuble
    self.order(price: :desc).limit(1)
  end

  def self.most_popular

    user_books = self.all
    arr = user_books.map{|i|i.book_id}
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    book_id = arr.max_by { |v| freq[v] }

   @most_popular_book = Book.find(book_id)

 end

end
