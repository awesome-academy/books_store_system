class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :content, presence: true,
    length: {maximum: Settings.max_content}
end
