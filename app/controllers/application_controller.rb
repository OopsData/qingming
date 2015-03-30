class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_view_count

  def set_view_count
    @app ||= (App.first || App.create)
    @app.view_count += 1
    @app.save
  end
end
