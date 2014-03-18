module Refinery
  module Careers
    class Setting < Refinery::Core::BaseModel

      class << self
        def confirmation_body
          Refinery::Setting.find_or_set(:career_confirmation_body,
            "Thank you for your career %name%,\n\nThis email is a receipt to confirm we have received your career and we'll be in touch shortly.\n\nThanks."
          )
        end

        def confirmation_subject
          Refinery::Setting.find_or_set(:career_confirmation_subject,
                                        "Thank you for your career")
        end

        def confirmation_subject=(value)
          Refinery::Setting.set(:career_confirmation_subject, value)
        end

        def notification_recipients
          Refinery::Setting.find_or_set(:career_notification_recipients,
                                        (Role[:refinery].users.first.try(:email) if defined?(Role)).to_s)
        end

        def notification_subject
          Refinery::Setting.find_or_set(:career_notification_subject,
                                        "New career from your website")
        end
      end

    end
  end
end
