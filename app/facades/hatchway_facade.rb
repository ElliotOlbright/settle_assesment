class HatchwayFacade
  def self.create_posts(params)
    json = HatchwayService.get_posts(params)
    posts = json[:posts].map do |post|
        Post.new(post)
    end 

    if params[:sortBy].present?
      posts = posts.sort_by! { |x| x.send(params[:sortBy]).to_i }
      params[:direction] == "desc" ? posts.reverse! : posts
    end 
    posts
  end
end