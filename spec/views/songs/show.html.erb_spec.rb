require 'rails_helper'

RSpec.describe "songs/show", :type => :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :name => "Name",
      :type => "Type",
      :singer => "Singer",
      :img => "Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Singer/)
    expect(rendered).to match(/Img/)
  end
end
