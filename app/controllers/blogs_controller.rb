class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update, :edit]
  before_action :set_blog, only: [:show, :edit, :update]
  before_action :set_variables, only: [:create, :new]

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
      flash[:alert] = @blog.errors.full_messages
      render :edit
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: 'Blog post was successfully created.'
    else
      flash[:alert] = @blog.errors.full_messages

      render turbo_stream: [
        turbo_stream.replace('new_blog_form', partial: 'shared/blog_form'),
        turbo_stream.update('flash_error', partial: 'shared/flash_error'),
        turbo_stream.update('flash', partial: 'shared/flash')
      ]
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

  def set_variables
    flash.clear
  end
end
