class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    validates :opinion, presence: true
    validates :user_id , presence: true
end
