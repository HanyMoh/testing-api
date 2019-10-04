class CreateConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :consoles do |t|
      t.string :name, null: false
      t.string :manufacture, null: false

      t.timestamps
    end
  end
end
