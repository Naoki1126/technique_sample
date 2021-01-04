class CreateCsvs < ActiveRecord::Migration[5.2]
  def change
    create_table :csvs do |t|
      t.string :name
      t.integer :progress_days
      t.timestamps
    end
  end
end
