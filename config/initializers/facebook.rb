FACEBOOK_APP_ID = "395931900539495"
FACEBOOK_SECRET = "6f5ae7b5a96431e03eaffecc7be3fd41"

OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, FACEBOOK_APP_ID, FACEBOOK_SECRET
end
