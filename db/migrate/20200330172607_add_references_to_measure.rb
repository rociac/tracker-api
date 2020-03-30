class AddReferencesToMeasure < ActiveRecord::Migration[6.0]
  def change
    add_reference :measures, :measure_date, null: false, foreign_key: true
  end
end
