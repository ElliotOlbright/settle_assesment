require 'rails_helper'

RSpec.describe HatchwayFacade do
  describe 'post creation' do
    it 'can create posts' do 
      params = { tag: "tech", sortBy: "likes", direction: "asc" }
      posts = HatchwayFacade.create_posts(params)
      expect(posts.count).to eq(28)

      posts.each do |post|
        expect(post).to be_an_instance_of(Post)
      end
    end
  end 
end 