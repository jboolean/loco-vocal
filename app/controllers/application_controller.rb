class ApplicationController < ActionController::Base
  @@mdparser = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :authenticated_user, :logged_in?

  def authenticated_user
    @authenticated_user ||= User.find(session[:authenticated_user_id]) unless session[:authenticated_user_id].nil?
  end

  def logged_in?
      authenticated_user != nil
  end

end
