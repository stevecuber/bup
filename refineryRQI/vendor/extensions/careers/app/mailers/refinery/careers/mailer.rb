module Refinery
  module Careers
    class Mailer < ActionMailer::Base

      def confirmation(career, request)
        @career = career
        mail :subject  => Refinery::Careers::Setting.confirmation_subject,
             :to       => career.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::Careers::Setting.notification_recipients.split(',').first
      end

      def notification(career, request)
        @career = career
        mail :subject  => Refinery::Careers::Setting.notification_subject,
             :to       => Refinery::Careers::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
