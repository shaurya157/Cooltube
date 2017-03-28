class Comment < ApplicationRecord
  validates :user_id, :video_id, :body, :video_time, presence: true
  after_initialize :ensure_comment_statistics

  belongs_to :user
  belongs_to :video

  def ensure_comment_statistics
    self.likes ||= 0
    self.dislikes ||= 0
  end
end
