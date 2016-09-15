class CreateTitleRequests < ActiveRecord::Migration[5.0]
  def change
    add_timestamps :title_requests, default: Date.current
  end
end
