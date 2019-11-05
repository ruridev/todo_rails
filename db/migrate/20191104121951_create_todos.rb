class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.string :body, null: false
      t.date :date, null: false
      t.integer :complete, default: 0

      t.timestamps
    end
  end
end
