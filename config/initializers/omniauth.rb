OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  if ENV['RAILS_ENV'] == 'test'
    provider :google_oauth2, '944841464959-k46mvrjj057bkk6g31naghgh8qbc6v7n.apps.googleusercontent.com', '2NyLEV1uopepujbvFJ2CQuQg', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}, redirect_uri: "http://localhost:3000/auth/google_oauth2/callback", access_type: 'offline', approval_prompt: ''}
  else
    provider :google_oauth2, '944841464959-k46mvrjj057bkk6g31naghgh8qbc6v7n.apps.googleusercontent.com', '2NyLEV1uopepujbvFJ2CQuQg', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}, access_type: 'offline', approval_prompt: ''}
  end
end