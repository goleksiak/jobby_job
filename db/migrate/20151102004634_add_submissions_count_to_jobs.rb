class AddSubmissionsCountToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :submissions_count, :integer, default: 0
  end
end
