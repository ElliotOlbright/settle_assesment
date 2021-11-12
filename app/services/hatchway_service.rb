class HatchwayService < BaseService
  def self.get_posts(params)
    response = conn('https://api.hatchways.io/assessment/blog/posts').get do |f|
      f.params['tag'] = params[:tag]
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end 