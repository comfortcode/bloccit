class CommentsController < ApplicationController

   def destroy
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = Comment.find(params[:id])
 
     authorize @comment
     
     if @comment.destroy
       flash[:notice] = "The comment was deleted successfully."
     else
       flash[:error] = "There was an error deleting the comment."
     end
     redirect_to [@topic, @post]
   end  
  
  
  def new
     @topic = Topic.find(params[:topic_id]) #needed?
     @post = Post.find(params[:post_id])
     @comment = Comment.new
     authorize @comment
   end
  
   def create
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
     @comment = current_user.comments.build(params.require(:comment).permit(:body))
     @comment.post = @post
     authorize @comment

     if @comment.save
       flash[:notice] = "Comment was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the comment. Please try again."
       render :new
     end
   end
  
end
