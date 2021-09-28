class Book
  attr_reader :isbn, :publisher, :title

  def initialize(data)
    @isbn = data[:isbn] ||= []
    @publisher = data[:publisher] ||= []
    @title = data[:title]
  end
end
