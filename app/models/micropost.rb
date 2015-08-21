class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
  validates :avatar, presence: true
  mount_uploader :avatar, AvatarUploader
end