class Api::PostsController < ApplicationController
  def index
    posts = HatchwayFacade.create_posts(params)
    render(json: HatchwaySerializer.get_json(posts))
  end 
end 