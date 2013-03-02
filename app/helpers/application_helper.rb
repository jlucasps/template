module ApplicationHelper


  def todo_error_messages!(object = nil)
    resource ||= object
    return "" if resource.blank? or resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved", :count => resource.errors.count, :resource => resource.class.model_name.human.downcase)

    html = bootstrap_alert(sentence, messages, "alert-error")

    # Synapses - Modifica o layout padrão para identificar inputs com erro de validação
    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
      unless html_tag =~ /^<label/
        %(#{html_tag}<span class="help-inline error">&nbsp;#{instance.error_message.first}</span>).html_safe
      else
        %(#{html_tag}).html_safe
      end
    end

    html.html_safe
  end

end
