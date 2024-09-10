class ChangeApprovedDefaultInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :approved, true
  end
end
