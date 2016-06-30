class TestController < ApplicationController
  def search
  @search = Post.search(params[:q])
  @posts = @search.result
  end
end
