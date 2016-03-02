class CommentsController < ApplicationController

   def destroy
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
 
     authorize @comment
     
     @comment.destroy
     
     respond_to do |format|
       format.html
       format.js
     end
     
   end  
  
  
  def new
     @post = Post.find(params[:post_id])
     @comment = Comment.new
     authorize @comment
  end
  
 def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = Comment.new( comment_params )
    @comment.user = current_user
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    @comment.save
    
    respond_to do |format|
      format.html {redirect_to [@post.topic, @post]}
      format.js
    end
 end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end