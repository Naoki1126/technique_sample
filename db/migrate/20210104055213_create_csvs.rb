class CreateCsvs < ActiveRecord::Migration[5.2]
  def change
    create_table :csvtests do |t|
      t.string :name
      t.integer :progress_days
      t.timestamps
    end
  end
end
