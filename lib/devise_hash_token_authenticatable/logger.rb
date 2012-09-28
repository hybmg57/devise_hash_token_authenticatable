module DeviseHashTokenAuthenticatable
  class Logger
    def self.send(message, logger = Rails.logger)
      if ::Devise.hash_token_logger
        logger.add 0, "  \e[36mHASHTOKEN:\e[0m #{message}"
      end
    end
  end
end
