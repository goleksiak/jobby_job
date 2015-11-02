class RenameDocumentLocationPublicUrl < ActiveRecord::Migration
  def change
    rename_column :documents, :location, :public_url
  end
end
