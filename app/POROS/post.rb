class Post
  attr_reader :author, :authorId, :id, :likes, :popularity, :reads, :tags

  def initialize(data)
    @author = data[:author],
    @authorId = data[:authorId],
    @id = data[:id],
    @likes = data[:likes],
    @popularity = data[:popularity],
    @reads = data[:reads],
    @tags = data[:tags]
  end
end 