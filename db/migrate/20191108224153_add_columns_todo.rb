class AddColumnsTodo < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :display_order, :integer
    add_column :todos, :kind, :integer
  end
end
