class SummariesController < ApplicationController
  def index
    @sums = Summary.all
  end

  def show
     @sum = Summary.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @sum = Summary.new
  end

   def create
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:post_id])
#      why doesnt this work?
#      @sum = Summary.new(params.require(:body))
#      @sum.post = @post
     @sum = Summary.create!({
       post: @post,
       body: params[:summary][:body]
       })

     if @sum.save
       flash[:notice] = "Summary was saved."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the summary. Please try again."
       render :new
     end
   end

end