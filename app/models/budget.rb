class Budget < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :budget_groups, dependent: :destroy
  has_many :groups, through: :budget_groups, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
