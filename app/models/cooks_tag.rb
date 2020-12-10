class CooksTag

  include ActiveModel::Model
  attr_accessor :title, :text, :user_id, :name, :image, :video, :resipe, :category_id

  validates :title, :name, :resipe, presence: true

  
  def save
    cook = Cook.create(title: title, text: text, resipe: resipe, user_id: user_id, category_id: category_id, image: image, video: video)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    CookTagRelation.create(cook_id: cook.id, tag_id: tag.id)
  end
end