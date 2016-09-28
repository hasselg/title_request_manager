class TitleRequest < ApplicationRecord
  validates_presence_of :LAST_NAME
  validates :FILEOPENED, :CLOSE_DATE, in_future: {future: false} 

  def as_json(options = {})
    {
      :id => self.id,
      :last_name => self.LAST_NAME,
      :first_name => self.FIRST_NAME,
      :file_opened => self.FILEOPENED,
      :town => self.TOWN
    }
  end

  scope :file_not_closed, -> {
    where("FILE_CLOSE IS NULL OR FILE_CLOSE = \"\"")
  }

  def get_open_summary
    {
      "BANK" => self.BANK,
      "FILE_NO" => self.FILE_NO,
      "LAST_NAME" => self.LAST_NAME,
      "COUNTY" => self.COUNTY,
      "CLOSE_DATE" => self.CLOSE_DATE,
      "PAYMNT_RCD" => self.REC_PAY_FN,
      "POLICY_ISS" => self.POLICY_ISS,
      "OR_RECD_BY" => self.OR_RECD_BY
    }
  end

  def validate_date_not_in_future(model, attr, value)
    if attr.present? && value > Date.today
      errors.add(attr, "can't be in the future")
    end
  end
end
