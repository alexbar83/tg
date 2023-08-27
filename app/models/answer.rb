class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
   validate :validate_max_answers_count, on: :create

   private

  def validate_max_answers_count
    message = 'can only have maximum 4 answers!'
    errors.add(:question, message) if question.answers.count >= 4
  end
end
