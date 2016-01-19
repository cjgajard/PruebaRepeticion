class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.integer :status
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
