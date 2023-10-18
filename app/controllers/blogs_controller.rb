class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.limit(10) # TODO paginate
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog post was successfully update.'
    else
      flash[:update] = 'Blog creation failed'
      flash[:error] = @blog.errors.full_messages
      render :edit
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path, notice: 'Blog created successfully'
    else
      flash[:alert] = 'Blog creation failed'
      flash[:error] = @blog.errors # TODO assign errors into key value pair with full messages
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :image, :content)
  end

  def set_blog
    @blog = Blog.find_by(id: params[:id])

    unless @blog
      flash[:alert] = "Blog not found."
      redirect_to blogs_path
    end
  end
end
