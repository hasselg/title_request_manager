class CreateAbstracts < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :abstracts, default: Date.current
  end
end
