class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum:200}}
    validates :matter, {presence: true, length: {maximum:200}}
    validates :episode, {presence: true, length: {maximum:200}}
    validates :user_id, {presence: true}
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    belongs_to :user
    has_many :comments, dependent: :destroy
end
