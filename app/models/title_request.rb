class TitleRequest < ApplicationRecord
  validates_presence_of :LAST_NAME
  validates_date :ORDER_RECD, :on_or_before => :today, :allow_blank => true
  validates_date :FILEOPENED, :on_or_before => :today, :allow_blank => true
  validates_date :TIT_REVIEW, :on_or_before => :today, :on_or_after => :FILEOPENED,
    :allow_blank => true
  validates_date :COMMIT_OUT, :on_or_before => :today, :allow_blank => true
  validates_date :COMMIT_BCK, :on_or_before => :today, :allow_blank => true
  validates_date :COMMIT_ISS, :on_or_before => :today, :allow_blank => true
  validates_date :CLOSE_DATE, :on_or_before => :today, :allow_blank => true
  validates_date :MARKUP_RCD, :on_or_before => :today, :allow_blank => true
  validates_date :REC_PAY, :on_or_before => :today, :allow_blank => true
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

  def get_total_mtg_premium
    case self[:LT_TT_W_FN]
      when "LT"
        total = self[:MTG_PREM] ||= 0
      when "TT"
        total = self[:MTG_PREM_T] ||= 0
      when "W"
        total = self[:W_PREM_M3] ||= 0
      when "FN"
        m = self[:FN_PREM_M] ||= 0
        m2 = self[:FN_PREM_M2] ||= 0
        total = m + m2
      else
        total = 0
    end

    total
  end

  def get_total_owner_premium
    case self[:LT_TT_W_FN]
      when "LT"
        total = self[:FEE_PREM] ||= 0
      when "TT"
        total = self[:FEE_PREM_T] ||= 0
      when "W"
        total = self[:W_PREM_O3] ||= 0
      when "FN"
        o = self[:FN_PREM_O] ||= 0
        o2 = self[:FN_PREM_O2] ||= 0
        total = o + o2
      else
        total = 0
    end

    total
  end

  def get_remittance_amount
    case self[:LT_TT_W_FN]
      when "TT"
        total = self[:TTIC_AMNT]
      when "W"
        total = self[:WLTIC_AMNT]
      when "FN", "LT"
        amnt1 = self[:FNTI_AMNT] ||= 0
        amnt2 = self[:FNTI_NEW] ||= 0
        amnt3 = self[:FNTI_4_11] ||= 0

        total = amnt1 + amnt2 + amnt3
      else
        total = 0
    end

    total
  end

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
