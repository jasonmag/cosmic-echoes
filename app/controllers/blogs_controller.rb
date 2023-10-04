class BlogsController < ApplicationController

  def index
    @blogs = Blog.limit(10) # TODO paginate
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: 'Blog created successfully'
    else
      render :new
    end
  end

  private

  def blog_params
    params.permit(:title,:image,:body)
  end
end
