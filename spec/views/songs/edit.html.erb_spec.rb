require 'rails_helper'

RSpec.describe "songs/edit", :type => :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :name => "MyString",
      :type => "",
      :singer => "MyString",
      :img => "MyString"
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input#song_name[name=?]", "song[name]"

      assert_select "input#song_type[name=?]", "song[type]"

      assert_select "input#song_singer[name=?]", "song[singer]"

      assert_select "input#song_img[name=?]", "song[img]"
    end
  end
end
