class TitleRequest < ApplicationRecord

  def as_json(options = {})
    {
      :id => self.id,
      :last_name => self.LAST_NAME,
      :first_name => self.FIRST_NAME,
      :town => self.TOWN
    }
  end
end
