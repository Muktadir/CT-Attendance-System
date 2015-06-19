class AddFieldToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :firstname, :string
    add_column :employees, :lastname, :string
    add_column :employees, :admin, :boolean, :default => false
  end
end
