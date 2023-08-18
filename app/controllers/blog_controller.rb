class BlogController < ApplicationController

  def index
    @blog = Blog.all
  end
end
