class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true

end
