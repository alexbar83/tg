class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :test_passages
    has_many :gists
    
  has_many :tests, through: :test_passages
  has_many :badges, through: :attaiments

   validates :email, presence: true
                    

  has_many :tests_created, class_name: 'Test', foreign_key: :author_id
	def by_level(level)
    tests.level(level)
  end

  def test_passage(test) 
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
