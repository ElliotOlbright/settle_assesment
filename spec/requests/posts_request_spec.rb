require 'rails_helper'

RSpec.describe 'Get Posts' do
  it 'can return all posts' do 
    params = { tag: "tech" }

    get "/api/posts", params: params

    expect(response).to be_successful
    expect(response.status).to eq (200)

    posts = JSON.parse(response.body, symbolize_names: true)

    expect(posts).to have_key(:posts)
    expect(posts[:posts]).to be_an(Array)
    expect(posts[:posts][0]).to be_a(Hash)
    expect(posts[:posts][0]).to have_key(:author)
    expect(posts[:posts][0][:author]).to be_a(String)
    expect(posts[:posts][0]).to have_key(:authorId)
    expect(posts[:posts][0][:authorId]).to be_an(Integer)
    expect(posts[:posts][0]).to have_key(:id)
    expect(posts[:posts][0][:id]).to be_an(Integer)
    expect(posts[:posts][0]).to have_key(:popularity)
    expect(posts[:posts][0][:popularity]).to be_a(Integer)
    expect(posts[:posts][0]).to have_key(:reads)
    expect(posts[:posts][0][:reads]).to be_an(Integer)
    expect(posts[:posts][0]).to have_key(:tags)
    expect(posts[:posts][0][:tags]).to be_an(Array)
  end 

  it 'can return posts with likes' do 
    params = { tag: "tech", sortBy: "likes" }

    get "/api/posts", params: params

    expect(response).to be_successful
    expect(response.status).to eq (200)

    posts = JSON.parse(response.body, symbolize_names: true)
    expect(posts[:posts][0][:likes]).to be < (posts[:posts][-1][:likes])
  end 

  it 'can return posts with likes' do 
    params = { tag: "tech", sortBy: "reads" }

    get "/api/posts", params: params

    expect(response).to be_successful
    expect(response.status).to eq (200)

    posts = JSON.parse(response.body, symbolize_names: true)
    expect(posts[:posts][0][:reads]).to be < (posts[:posts][-1][:reads])
  end 

  it 'can return posts with likes' do 
    params = { tag: "tech", sortBy: "id" }

    get "/api/posts", params: params

    expect(response).to be_successful
    expect(response.status).to eq (200)

    posts = JSON.parse(response.body, symbolize_names: true)
    expect(posts[:posts][0][:id]).to be < (posts[:posts][-1][:id])
  end 

  it 'can return posts with likes' do 
    params = { tag: "tech", sortBy: "popularity" }

    get "/api/posts", params: params

    expect(response).to be_successful
    expect(response.status).to eq (200)

    posts = JSON.parse(response.body, symbolize_names: true)
    expect(posts[:posts][0][:popularity]).to be < (posts[:posts][-1][:popularity])
  end 

  it 'can return error if sortBy incorrect' do 
    params = { tag: "tech", sortBy: "lanceArmstrong" }
    get "/api/posts", params: params

    expect(response).to_not be_successful
    expect(response.status).to eq (400)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq("sortBy parameter is invalid")
  end 

  it 'can return error if tag missing' do 
    params = { sortBy: "lanceArmstrong" }
    get "/api/posts", params: params

    expect(response).to_not be_successful
    expect(response.status).to eq (400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:error]).to eq("Tags parameter is required")
  end 
end 