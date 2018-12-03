json.extract! blog, :id, :image_data, :created_at, :updated_at
json.url blog_url(blog, format: :html)
json.image_url blog.image_url
