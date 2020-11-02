class BookInStock
  attr_reader :isbn, :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = price
  end
end

book = BookInStock.new('isbn', 12.33)

p book