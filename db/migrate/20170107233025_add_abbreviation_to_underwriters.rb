class AddAbbreviationToUnderwriters < ActiveRecord::Migration[5.0]
  def change
    change_table :underwriters do |t|
      t.string :abbreviation
    end
  end
end
