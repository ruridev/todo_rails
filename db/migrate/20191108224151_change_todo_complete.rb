class ChangeTodoComplete < ActiveRecord::Migration[6.0]
  def change
    rename_column :todos, :complete, :checked
    change_column :todos, :checked, :boolean
  end
end
