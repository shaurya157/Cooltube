class Video < ApplicationRecord
  validates :user_id, :title, presence: true
  validates :URL, presence: true, uniqueness: true
  after_initialize :ensure_url, :ensure_video_statistics

  belongs_to :user

  def ensure_url
    # TODO: Add way to create new random URL
  end

  def ensure_video_statistics
    self.likes ||= 0
    self.dislikes ||= 0
    self.views ||= 0
  end
end
