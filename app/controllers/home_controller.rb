class HomeController < ApplicationController
  def index
    @blogs = Blog.limit(3)
  end
end
