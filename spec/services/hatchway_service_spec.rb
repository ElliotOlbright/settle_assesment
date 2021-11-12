require 'rails_helper'

RSpec.describe HatchwayService do
  it 'returns posts with tag' do
    params = { tag: "tech" }
    posts = HatchwayService.get_posts(params)

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
    expect(posts[:posts][0][:popularity]).to be_a(Float)
    expect(posts[:posts][0]).to have_key(:reads)
    expect(posts[:posts][0][:reads]).to be_an(Integer)
    expect(posts[:posts][0]).to have_key(:tags)
    expect(posts[:posts][0][:tags]).to be_an(Array)
  end
end 