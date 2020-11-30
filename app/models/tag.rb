class Tag < ApplicationRecord
  
  has_many :cook_tag_relations
  has_many :cooks, through: :cook_tag_relations
  
  validates :name, uniqueness: true
end
