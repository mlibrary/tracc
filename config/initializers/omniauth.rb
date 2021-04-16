Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_SECRET']
  provider :google_oauth2, '581284559742-584cc9aup8rbv2eaoht8podv8vdlkond.apps.googleusercontent.com', 'eml1rqoEtMGFL_DeD4tzYNXm'
end