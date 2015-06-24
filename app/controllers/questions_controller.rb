class QuestionsController < ApplicationController

  def index
     @questions = Question.all
   end

  def show
     @q = Question.find(params[:id])
   end

   def new
     @q = Question.new
   end

  def create
     @q = Question.new(params.require(:question).permit(:title, :body, :resolved))
     if @q.save
       flash[:notice] = "Question was saved."
       redirect_to @q
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :new
     end
   end

   def edit
     @q = Question.find(params[:id])
   end

   def update
     @q = Question.find(params[:id])
     if @q.update_attributes(params.require(:question).permit(:title, :body, :resolved))
       flash[:notice] = "Question was updated."
       redirect_to @q
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
   end

  def destroy
    @q.destroy
    flash[:notice] = "Question was destroyed."
  end

end