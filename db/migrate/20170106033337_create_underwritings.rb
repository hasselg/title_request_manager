class CreateUnderwritings < ActiveRecord::Migration[5.0]
  def change
    create_table :underwritings do |t|
      t.belongs_to :underwriter, index: true
      t.belongs_to :title_request, index: true

      t.timestamps
    end
  end
end
