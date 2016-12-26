class RemoveIndexOnResetToken < ActiveRecord::Migration[5.0]
  def self.up
    remove_index :users, name: 'index_users_on_reset_password_token'
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
