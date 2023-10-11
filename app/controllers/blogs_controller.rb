class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.limit(10) # TODO paginate
  end

  def show
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

  def set_blog
    @blog = Blog.find_by(id: params[:id])

    unless @blog
      flash[:alert] = "Blog not found."
      redirect_to blogs_path
    end
  end
end
