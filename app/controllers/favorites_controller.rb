class FavoritesController < ApplicationController
  
  def create
     post = Post.find(params[:post_id])
     favorite = current_user.favorites.build(post: post)
     authorize favorite
 
     if favorite.save
       flash[:notice] = "You have favorited the post."
       redirect_to [post.topic, post]
     else
       flash[:error] = "There was an error favoriting the post. Please try again."
       render :new
     end
   end
  
def destroy
     post = Post.find(params[:post_id])
     user = current_user
     favorite = Favorite.where(post: post, user: user).first
     authorize favorite 
  
   if favorite.destroy
     flash[:notice] = "You have unfavorited this post"
     redirect_to [post.topic, post]
   else
       flash[:error] = "There was an error unfavoriting the post. Please try again."
       render :new
   end
     
 end

end
