class Task < ApplicationRecord
    belongs_to :category
    validates :title, presence: true
    validates :description, presence:true, length: {minimum: 10}
    validates :deadline, presence:true
end
