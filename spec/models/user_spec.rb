require 'rails_helper'
include TestFactories 

describe User do
 
     before do
       @post = associated_post
       @user = authenticated_user
     end
  
   describe "#favorited(post)" do
     it "returns `nil` if the user has not favorited the post" do
       expect(@user.favorited(@post)).to eq(nil)
     end
 
     it "returns the appropriate favorite if it exists" do
       new_fav = Favorite.create(post: @post, user: @user)
       expect(@user.favorited(@post)).to eq(new_fav)
     end
     
   end
   
 end