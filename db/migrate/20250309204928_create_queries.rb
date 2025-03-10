class CreateQueries < ActiveRecord::Migration[7.2]
  def change
    create_table :queries do |t|
      t.date :start, default: false
      t.date :end, default: false
      t.integer :respondent, default: false
      t.text :response

      t.timestamps
    end
  end
end
