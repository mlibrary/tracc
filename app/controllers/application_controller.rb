class ApplicationController < ActionController::Base
	#before_action :authenticate_user!

	# Temporary because gordonl isn't sure how to permit params for the catalog controller
  ActionController::Parameters.permit_all_parameters = true

  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

end
