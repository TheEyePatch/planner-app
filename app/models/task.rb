class Task < ApplicationRecord
    belongs_to :category
    validates :title, presence: true, uniqueness: {scope: :category_id}, length:{maximum: 25}
    validates :description, presence:true, length: {minimum: 10}
    validates :deadline, presence:true
    validate :deadline_cannot_be_in_the_past, on: :create

    def deadline_cannot_be_in_the_past
        if deadline.present? && deadline < Date.today
            errors.add(:deadline, "must not be in the past")
        end
    end
end
