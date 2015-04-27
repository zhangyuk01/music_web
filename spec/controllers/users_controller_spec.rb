require 'rails_helper'

describe UsersController do
  before do
    user1=User.create :name=>"Lucy",:sex=>"male"
    user2=User.create :name=>"Tom",:sex=>"famel"
  end
  it 'should get index' do
    get :index
    response.should be_success
  end

  it 'should post create' do
    post :create,
    :user =>{
    :name=>"zhangyu",
    :sex => 'male'
    }
    User.count.should==3
    User.last.name=="zhangyu"
  end
end









#describe UsersController do
#  before do
#   @user1= User.create :name=>"Lucy",:sex=>'woman'   ;
#    User.create :name=>"Tom",:sex=>'man';
#  end

#   it 'should get index' do
#      get :index
#      response.should be_success
#   end

#   it 'should post create' do
#     post :create , :user =>{
#     :name=>"zhangyu",
#     :sex=>"man",

#     }
#     User.count.should ==3
#     User.last.name =="zhangyu"
#   end
#   it 'should update ' do
#     put :update , :user=>{
#      :name=>"Lily",
#     }, :id=>@user1.id
#     @user1.reload.name.should=="Lily"
#   end

#end

