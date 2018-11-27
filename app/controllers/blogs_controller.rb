class BlogsController < ApplicationController
  before_action :find_blog, only: [:edit, :update, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    if can? :manage, @blog
      @blog = Blog.new(blog_params)
    else
      redirect_to blogs_path
    end

    if @blog.save
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :category, :content)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
end
