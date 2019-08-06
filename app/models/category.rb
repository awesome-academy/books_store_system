class Category < ApplicationRecord
  belongs_to :parent, class_name: Category.name, optional: true
  has_many :childs, class_name: Category.name, foreign_key: :parent_id,
    dependent: :destroy
  has_many :products, dependent: :destroy
  validates :name, presence: true,
    length: {maximum: Settings.maximum_length_name}
end
