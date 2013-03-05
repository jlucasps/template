require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js
  protect_from_forgery

  before_filter :authenticate_user!

end
