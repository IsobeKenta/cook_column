class Cook < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :cook_tag_relations, dependent: :destroy
  has_many :tags, through: :cook_tag_relations
  has_one_attached :image
  has_one_attached :video
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  validates :text , presence: true, unless: :was_attached?
  def was_attached?
    self.image.attached?
    self.video.attached?
  end
 
  validate :image_presence
  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    end
  end
  validate :video_presence
  def video_presence
    if video.attached?
      if !video.content_type.in?(%('video/mp4 video/mov'))
        errors.add(:video, 'にはmp4またはmovファイルを添付してください')
      end
    end
  end

end
