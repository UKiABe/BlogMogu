json.extract! blog, :id, :image_data, :created_at, :updated_at
json.url blog_url(blog, format: :json)
json.image_url photo.image_url
