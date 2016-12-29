class TitleRequest < ApplicationRecord
  validates_presence_of :last_name
  validates_date :order_recd, :on_or_before => :today, :allow_blank => true
  validates_date :fileopened, :on_or_before => :today, :allow_blank => true
  validates_date :tit_review, :on_or_before => :today, :on_or_after => :fileopened,
    :allow_blank => true
  validates_date :commit_out, :on_or_before => :today, :allow_blank => true
  validates_date :commit_bck, :on_or_before => :today, :allow_blank => true
  validates_date :commit_iss, :on_or_before => :today, :allow_blank => true
  validates_date :close_date, :on_or_before => :today, :allow_blank => true
  validates_date :markup_rcd, :on_or_before => :today, :allow_blank => true
  validates_date :rec_pay, :on_or_before => :today, :allow_blank => true
  validates_date :rec_doc_rd, :on_or_before => :today, :allow_blank => true
  validates_date :redate_abs, :on_or_before => :today, :allow_blank => true
  validates_date :policy_out, :on_or_before => :today, :allow_blank => true
  validates_date :policy_bck, :on_or_before => :today, :allow_blank => true
  validates_date :policy_iss, :on_or_before => :today, :allow_blank => true
  validates_date :file_close, :on_or_before => :today,
    :after => :fileopened, :allow_blank => true

  def order_recd=(v)
    self[:order_recd] = Timeliness.parse(v)
  end

  def fileopened=(v)
    self[:fileopened] = Timeliness.parse(v)
  end

  def tit_review=(v)
    self[:tit_review] = Timeliness.parse(v)
  end

  def commit_out=(v)
    self[:commit_out] = Timeliness.parse(v)
  end

  def commit_bck=(v)
    self[:commit_bck] = Timeliness.parse(v)
  end

  def commit_iss=(v)
    self[:commit_iss] = Timeliness.parse(v)
  end

  def close_date=(v)
    self[:close_date] = Timeliness.parse(v)
  end

  def markup_rcd=(v)
    self[:markup_rcd] = Timeliness.parse(v)
  end

  def rec_pay=(v)
    self[:rec_pay] = Timeliness.parse(v)
  end

  def rec_doc_rd=(v)
    self[:rec_doc_rd] = Timeliness.parse(v)
  end

  def redate_abs=(v)
    self[:redate_abs] = Timeliness.parse(v)
  end

  def policy_out=(v)
    self[:policy_out] = Timeliness.parse(v)
  end

  def policy_bck=(v)
    self[:policy_bck] = Timeliness.parse(v)
  end

  def policy_iss=(v)
    self[:policy_iss] = Timeliness.parse(v)
  end

  def file_close=(v)
    self[:file_close] = Timeliness.parse(v)
  end

  def as_json(options = {})
    {
      :id => self.id,
      :file_no => self.file_no,
      :last_name => self.last_name,
      :first_name => self.first_name,
      :file_opened => self.fileopened,
      :town => self.town
    }
  end

  scope :file_not_closed, -> {
    where("file_close IS NULL OR file_close = ''")
  }

  def get_open_summary
    {
      "bank" => self.bank,
      "file_no" => self.file_no,
      "last_name" => self.last_name,
      "county" => self.county,
      "close_date" => self.close_date,
      "paymnt_rcd" => self.rec_pay_fn,
      "policy_iss" => self.policy_iss,
      "or_recd_by" => self.or_recd_by
    }
  end
end
