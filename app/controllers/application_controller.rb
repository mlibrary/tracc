class ApplicationController < ActionController::Base
	#before_action :authenticate_user!

  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

end
