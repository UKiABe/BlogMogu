class PhotosController < ApplicationController
  before_action :find_photo, only: [:update]
  before_action :authenticate_user!, only: [:create]

  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to blogs_path }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render "blogs/new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photo.update(blog_params)
        format.html { redirect_to @photo }
        format.json { render :show, status: :ok, location: @photo}
      else
        format.html { render "blogs/edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end
end
