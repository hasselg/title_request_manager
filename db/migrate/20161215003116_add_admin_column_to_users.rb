class AddAdminColumnToUsers < ActiveRecord::Migration[5.0]
  def self.up
    change_table :users do |t|
      t.boolean :admin, default: false
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
