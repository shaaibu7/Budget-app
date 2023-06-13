class CreateBudgetGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :budget_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
