class CommentsController < ApplicationController

   def destroy
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
 
     authorize @comment
     
     if @comment.destroy
       flash[:notice] = "The comment was deleted successfully."
     else
       flash[:error] = "There was an error deleting the comment."
     end
     
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

    if @comment.save
      flash[:notice] = "Comment was created."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
 end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end