class Blog < ApplicationRecord
  include ImageUploader[:image]
  enum category: { "最近のこと": 1, "ごはんレシピ": 2 }
end
