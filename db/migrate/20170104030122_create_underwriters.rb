class CreateUnderwriters < ActiveRecord::Migration[5.0]
  def change
    create_table :underwriters do |t|
      t.string :name

      t.timestamps
    end
  end
end
