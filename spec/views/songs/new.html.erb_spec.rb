require 'rails_helper'

RSpec.describe "songs/new", :type => :view do
  before(:each) do
    assign(:song, Song.new(
      :name => "MyString",
      :type => "",
      :singer => "MyString",
      :img => "MyString"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input#song_name[name=?]", "song[name]"

      assert_select "input#song_type[name=?]", "song[type]"

      assert_select "input#song_singer[name=?]", "song[singer]"

      assert_select "input#song_img[name=?]", "song[img]"
    end
  end
end
