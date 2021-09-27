class Book
  attr_reader :isbn, :publisher, :title

  def initialize(response_obj)
    @isbn = response_obj[:isbn] ||= []
    @publisher = response_obj[:publisher] ||= []
    @title = response_obj[:title]
  end
end
