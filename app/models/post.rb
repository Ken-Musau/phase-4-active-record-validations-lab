class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :title_must_be_clickbait_y

  #   custom validation
  def title_must_be_clickbait_y
    return unless title.present?
    clickbait_keywords = %w(Won't Believe
                            Secret
                            Top [number]
                            Guess)
    unless clickbait_keywords.any? { |keyword| title.include?(keyword) }
      errors.add(:title, "Title Must be clickbait-y")
    end
  end
end
