class TidyFormBuilder < ActionView::Helpers::FormBuilder
  def currency_field(attribute, options={})
    options[:value] = (ActionController::Base.helpers.number_with_precision(self.object[attribute], :precision => 2) ||0)

    wrap_currency_field(text_field(attribute, options))
  end

  def label(method, text = nil, options = {}, &block)
    options[:class] = "col-sm-2 control-label"
    super(method, text, options, &block)
  end

  def wrap_currency_field(text)
    "<div class=\"input-group\">
      <span class=\"input-group-addon\">$</span>
      #{text}
      </div>".html_safe
  end
end
