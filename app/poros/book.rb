class Book
  attr_reader :isbn, :title, :publisher

  def initialize(response_obj)
    # require "pry"; binding.pry
    @isbn = response_obj[:isbn]
    @title = response_obj[:title]
    @publisher = response_obj[:publisher]
  end
end
