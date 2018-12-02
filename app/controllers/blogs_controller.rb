class BlogsController < ApplicationController
  before_action :find_blog, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    if params[:category].blank?
      @blogs = Blog.all.order(created_at: :desc)
    else
      @blogs = Blog.where(category: params[:category]).order(created_at: :desc)
    end
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
      flash[:success] = "新しいブログ#{@blog.title}を作成しました。"
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def edit
  end

  def update
    flash[:success] = "#{@blog.title}を編集しました。"
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    flash[:success] = "#{@blog.title}を削除しました。"
    @blog.destroy
    redirect_to root_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :category, :content)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
end
