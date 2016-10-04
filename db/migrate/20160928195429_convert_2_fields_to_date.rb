class Convert2FieldsToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :Title_Requests, :REC_PAY_W, :date
    change_column :Title_Requests, :REC_PAY_TT, :date
  end
end
