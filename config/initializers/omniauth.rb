Rails.application.config.middleware.use OmniAuth::Builder do
  #register fails -> IdentityController#new
  provider :identity, fields: [:email], on_failed_registration: IdentitiesController.action(:new)
  # provider :facebook, ENV['FB_KEY'], ENV['FB_SECRET']
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end

#Login fails -> SessionController#failure
OmniAuth.config.on_failure = lambda do |env|
  SessionsController.action(:failure).call(env)
end

OmniAuth.config.logger = Rails.logger

# module OmniAuth
#   module Strategies
#     class Identity
#       def request_phase
#         redirect "/signin#{get_params}"
#       end
#
#       def registration_form
#         binding.pry
#         redirect "/signup#{get_params}"
#       end
#
#       def registration_phase
#         request.update_param('password', "123123")
#         request.update_param('password_confirmation', request['password'])
#         attributes = (options[:fields] + [:password, :password_confirmation]).inject({}){|h,k| h[k] = request[k.to_s]; h}
#         @identity = model.create(attributes)
#         if @identity.persisted?
#           env['PATH_INFO'] = callback_path
#           callback_phase
#         else
#           self.env['omniauth.identity'] = @identity
#           options[:on_failed_registration].call(self.env)
#         end
#       end
#
#       def get_params
#         params_url = request.params
#         return "" if params_url.empty?
#         content = "?"
#         params_url.each do |key, value|
#           content += key + "=" + value + "&"
#         end
#         content[0...(content.length - 1)]
#       end
#     end
#   end
# end

module OmniAuth
  module Strategies
    class Identity
      def request_phase
        redirect '/signin'
      end

      def registration_form
        redirect '/signup'
      end
    end
  end
end
