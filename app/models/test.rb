class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  
  has_many :test_passages
  has_many :users, through: :test_passages



  #belongs_to :author, class_name: 'User'

  validates :title, presence: true,
                    uniqueness: { scope: :level,
                                  message: 'Title and Level must be unique'}

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
   default_scope { order(title: :desc) }
   scope :easy,    -> { level(0..1) }
  scope :medium,  -> { level(2..4) }
  scope :hard,    -> { level(5..Float::INFINITY) }

    scope :by_category, -> (name) { joins(:category).where(categories: { title: name }) }

  def self.names_by_category(name)
    by_category(name).pluck(:title)
  end
end
