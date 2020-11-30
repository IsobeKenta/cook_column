class CookTagRelation < ApplicationRecord
  
  belongs_to :cook
  belongs_to :tag
  
end
