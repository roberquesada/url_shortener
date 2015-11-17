class AddVisitedToLink < ActiveRecord::Migration
  def change
    add_column :links, :visited, :integer, default: 1
  end
end
