class Video < ApplicationRecord
  validates :user_id, :title, presence: true
  validates :URL, presence: true, uniqueness: true
  after_initialize :ensure_url, :ensure_video_statistics

  belongs_to :user
  has_many :comments, dependent: :destroy

  def ensure_url
    self.URL ||= SecureRandom.hex
  end

  def ensure_video_statistics
    self.likes ||= 0
    self.dislikes ||= 0
    self.views ||= 0
  end
end
