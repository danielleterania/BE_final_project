class AddDeclinedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :declined, :boolean
  end
end
