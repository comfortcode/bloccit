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
     
   end  
  
  
  def new
     @post = Post.find(params[:post_id])
     @comment = Comment.new
     authorize @comment
   end
  
   def create
     @post = Post.find(params[:post_id])
     @comment = current_user.comments.build(params.require(:comment).permit(:body))
     @comment.post = @post
     authorize @comment

     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "There was an error saving the comment. Please try again."
       render :new
     end
   end
  
end
