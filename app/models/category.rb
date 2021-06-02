class Category < ApplicationRecord
    has_many :tasks, dependent: :destroy
    belongs_to :user
    validates :category_name, presence: true, uniqueness: true
end
