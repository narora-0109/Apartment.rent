class Image < ApplicationRecord
  belongs_to :listing
  mount_uploader :image_url, ImageUploader
end
