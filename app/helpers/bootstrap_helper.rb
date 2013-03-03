module BootstrapHelper

  # Retorna um ícone de 32x32
  def bootstrap_alert(sentence, messages, type)
    html = <<-HTML
      <div class="alert alert-block #{ type }">
        <a class="close" data-dismiss="alert" href="#"><i class="icon-large icon-remove-circle"></i></a>
        <div id="error_explanation">
          <p class="alert-heading">
            <b>#{sentence}</b>
          </p>
          <ul>#{messages}</ul>
        </div>
      </div>
    HTML
    html.html_safe
  end

  def bootstrap_flash
    msg = ""
    if flash[:success].present?
      msg += bootstrap_alert(t('success'), flash[:success], Const::ALERT_SUCCESS)
      flash[:success] = nil
    end
    if flash[:error].present?
      msg += bootstrap_alert(t('error'), flash[:error], Const::ALERT_ERROR)
      flash[:error] = nil
    end
    if flash[:alert].present?
      msg += bootstrap_alert(t('attention'), flash[:alert], Const::ALERT_WARNING)
      flash[:alert] = nil
    end
    if flash[:notice].present?
      msg += bootstrap_alert(t('info'), flash[:notice], Const::ALERT_INFO)
      flash[:notice] = nil
    end
    msg.html_safe
  end

  def link_label(icon, label)
    "<i class='#{icon}'></i>&nbsp;&nbsp;".html_safe + label
  end


end
