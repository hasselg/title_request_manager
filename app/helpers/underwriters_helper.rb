module UnderwritersHelper
  def get_num_associated_underwritings(underwriter)
    if underwriter.underwritings.nil?
      0
    else
      underwriter.underwritings.count
    end
  end
end
