class CreateTodoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_items do |t|
      t.string :body
      t.references :todo_list, index: true

      t.timestamps
    end
  end
end
