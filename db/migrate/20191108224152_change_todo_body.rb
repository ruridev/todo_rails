class ChangeTodoBody < ActiveRecord::Migration[6.0]
  def change
    rename_column :todos, :body, :text
  end
end
