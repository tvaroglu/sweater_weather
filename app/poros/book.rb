class Book
  attr_reader :isbn, :publisher, :title

  def initialize(response_obj)
    @isbn = if response_obj[:isbn]
              response_obj[:isbn]
            else
              []
            end
    @publisher = if response_obj[:publisher]
                   response_obj[:publisher]
                 else
                   []
                 end
    @title = response_obj[:title]
  end
end
