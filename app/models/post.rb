class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :contains_clickbait

  def contains_clickbait
    unless (/Won't Believe|Secret|Top \d+|Guess/).match? title
      errors.add(:title, "Not enough clickbait.")
    end
  end
end
