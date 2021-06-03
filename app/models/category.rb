class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :user
    validates :category_name, presence: true, uniqueness: {scope: :user_id}
end
