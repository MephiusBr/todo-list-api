class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :content

      t.timestamps
    end
   add_index :tasks, :name, unique: true
  end
end
