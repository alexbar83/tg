class Badge < ApplicationRecord
  BADGE_IMG = %w[badge.png].freeze
  BADGE_TYPES = %w[rule_type_first_try? rule_type_category? rule_type_level?].freeze 
  
  has_many :users, through: :attaiments
  has_many :attaiments

  validates :name, :image_url, :rule_type, presence: true
end
