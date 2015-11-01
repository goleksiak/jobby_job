class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :submission, index: true, foreign_key: true
      t.text :location

      t.timestamps null: false
    end
  end
end
