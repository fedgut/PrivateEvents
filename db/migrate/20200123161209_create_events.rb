class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :date
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
