class BlogsController < ApplicationController

  def index
    @blog = Blog.all
  end

  def def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: 'Blog created successfully'
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
