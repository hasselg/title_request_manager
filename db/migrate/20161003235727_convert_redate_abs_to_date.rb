class ConvertRedateAbsToDate < ActiveRecord::Migration[5.0]
  def change
    change_column :Title_Requests, :REDATE_ABS, :date
  end
end
