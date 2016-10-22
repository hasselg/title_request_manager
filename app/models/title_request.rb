class TitleRequest < ApplicationRecord
  validates_presence_of :LAST_NAME
  validates_date :ORDER_RECD, :on_or_before => :today, :allow_blank => true
  validates_date :FILEOPENED, :on_or_before => :today, :allow_blank => true
  validates_date :TIT_REVIEW, :on_or_before => :today, :after => :FILEOPENED,
    :allow_blank => true
  validates_date :COMMIT_OUT, :on_or_before => :today, :allow_blank => true
  validates_date :COMMIT_BCK, :on_or_before => :today, :allow_blank => true
  validates_date :COMMIT_ISS, :on_or_before => :today, :allow_blank => true
  validates_date :CLOSE_DATE, :on_or_before => :today, :allow_blank => true
  validates_date :MARKUP_RCD, :on_or_before => :today, :allow_blank => true
  validates_date :REC_PAY_FN, :on_or_before => :today, :allow_blank => true
  validates_date :REC_PAY_W, :on_or_before => :today, :allow_blank => true
  validates_date :REC_PAY_TT, :on_or_before => :today, :allow_blank => true
  validates_date :REC_DOC_RD, :on_or_before => :today, :allow_blank => true
  validates_date :REDATE_ABS, :on_or_before => :today, :allow_blank => true
  validates_date :POLICY_OUT, :on_or_before => :today, :allow_blank => true
  validates_date :POLICY_BCK, :on_or_before => :today, :allow_blank => true
  validates_date :POLICY_ISS, :on_or_before => :today, :allow_blank => true
  validates_date :FILE_CLOSE, :on_or_before => :today,
    :after => :FILEOPENED, :allow_blank => true

  def ORDER_RECD=(v)
    self[:ORDER_RECD] = Timeliness.parse(v)
  end

  def FILEOPENED=(v)
    self[:FILEOPENED] = Timeliness.parse(v)
  end

  def TIT_REVIEW=(v)
    self[:TIT_REVIEW] = Timeliness.parse(v)
  end

  def COMMIT_OUT=(v)
    self[:COMMIT_OUT] = Timeliness.parse(v)
  end

  def COMMIT_BCK=(v)
    self[:COMMIT_BCK] = Timeliness.parse(v)
  end

  def COMMIT_ISS=(v)
    self[:COMMIT_ISS] = Timeliness.parse(v)
  end

  def CLOSE_DATE=(v)
    self[:CLOSE_DATE] = Timeliness.parse(v)
  end

  def MARKUP_RCD=(v)
    self[:MARKUP_RCD] = Timeliness.parse(v)
  end

  def REC_PAY_FN=(v)
    self[:REC_PAY_FN] = Timeliness.parse(v)
  end

  def REC_PAY_W=(v)
    self[:REC_PAY_W] = Timeliness.parse(v)
  end

  def REC_PAY_TT=(v)
    self[:REC_PAY_TT] = Timeliness.parse(v)
  end

  def REC_DOC_RD=(v)
    self[:REC_DOC_RD] = Timeliness.parse(v)
  end

  def REDATE_ABS=(v)
    self[:REDATE_ABS] = Timeliness.parse(v)
  end

  def POLICY_OUT=(v)
    self[:POLICY_OUT] = Timeliness.parse(v)
  end

  def POLICY_BCK=(v)
    self[:POLICY_BCK] = Timeliness.parse(v)
  end

  def POLICY_ISS=(v)
    self[:POLICY_ISS] = Timeliness.parse(v)
  end

  def FILE_CLOSE=(v)
    self[:FILE_CLOSE] = Timeliness.parse(v)
  end

  def as_json(options = {})
    {
      :id => self.id,
      :file_no => self.FILE_NO,
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
end
