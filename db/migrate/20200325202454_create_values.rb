class CreateValues < ActiveRecord::Migration[6.0]
  def change
    create_table :values do |t|
      t.float :value
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
