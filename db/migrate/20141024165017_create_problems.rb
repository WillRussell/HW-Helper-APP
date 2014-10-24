class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.boolean :solved
      t.datetime :created_at

      t.timestamps
    end
  end
end
