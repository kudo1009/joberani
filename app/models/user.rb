class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable       
         
  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 200 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :age, numericality: true, allow_blank: true
  validates :town,length: { maximum: 30 }
  validates :introduce, presence: true, length: { maximum: 200 }
        
  before_validation { email.downcase! }
    
  mount_uploader :image, ImageUploader
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy
  
end
