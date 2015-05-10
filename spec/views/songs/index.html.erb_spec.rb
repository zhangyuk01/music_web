require 'rails_helper'

RSpec.describe "songs/index", :type => :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        :name => "Name",
        :type => "Type",
        :singer => "Singer",
        :img => "Img"
      ),
      Song.create!(
        :name => "Name",
        :type => "Type",
        :singer => "Singer",
        :img => "Img"
      )
    ])
  end

  it "renders a list of songs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Singer".to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
  end
end
