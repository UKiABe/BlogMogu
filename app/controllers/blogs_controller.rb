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

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog }
        format.json { render :show, status: :ok, location: @blog}
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    flash[:success] = "#{@blog.title}を削除しました。"
    @blog.destroy
    redirect_to root_path
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :category, :content, :image)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
end
