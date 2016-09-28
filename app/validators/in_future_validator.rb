class InFutureValidator < ActiveModel::EachValidator

  def validate_each(rec, attr, value)
    # Date is supposed to be in the future (explicit)
    if value.present? && options.key?(:future) && options[:future] == true && value.past? 
      rec.errors.add(attr, (options[:message] || "Date is not in the future"))

    # Date is supposed to be in the past (explicit)
    elsif value.present? && options.key?(:future) && options[:future] == false && value.future? 
      rec.errors.add(attr, (options[:message] || "Date is in the future"))

    # Default to expecting date to be in the future
    elsif value.present? && value.past?
      rec.errors.add(attr, (options[:message] || "Date is not in the future"))
    end
  end
end
