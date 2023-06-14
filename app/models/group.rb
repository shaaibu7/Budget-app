class Group < ApplicationRecord
  has_many :budget_groups, dependent: :destroy
  has_many :budgets, through: :budget_groups, dependent: :destroy
  belongs_to :author, foreign_key: :author_id, class_name: 'User'

  validates :name, presence: true
  validates :icon, presence: true
end
