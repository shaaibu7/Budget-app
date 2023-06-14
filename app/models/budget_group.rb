class BudgetGroup < ApplicationRecord
  belongs_to :group
  belongs_to :budget
end
