class ApplicationController < ActionController::Base
  protected

  def after_sign_out_path_for(resoruce_or_scope)
    request.referrer || root_path
  end
end
