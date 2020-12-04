class CooksTag

  include ActiveModel::Model
  attr_accessor :title, :text, :genre_id, :user_id, :name, :image, :video, :resipe

  validates :title, :name, :resipe, presence: true
  validates :genre_id, numericality: { other_than: 1 }

  
  def save
    cook = Cook.create(title: title, text: text, resipe: resipe, genre_id: genre_id, user_id: user_id, image: image, video: video)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    CookTagRelation.create(cook_id: cook.id, tag_id: tag.id)
  end
end