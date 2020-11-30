class Tag < ApplicationRecord
  
  has_many :cook_tag_relations, dependent: :destroy
  has_many :cooks, through: :cook_tag_relations
  
  validates :name, uniqueness: true
end
