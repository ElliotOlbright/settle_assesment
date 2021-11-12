class HatchwaySerializer
  def self.get_json(posts)
    {
      "posts": posts.map do |post|
        {
          "id": post.id,
          "author": post.author[0],
          "authorId": post.authorId,
          "likes": post.likes,
          "popularity": post.likes,
          "reads": post.reads,
          "tags": post.tags
        }
      end 
    }
  end 
end