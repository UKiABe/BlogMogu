json.extract! photo, :id, :image_data, :created_at, :updated_at
json.url blog_url(photo, format: :html)
json.image_url photo.image_url
