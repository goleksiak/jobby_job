class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :job, index: true, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
