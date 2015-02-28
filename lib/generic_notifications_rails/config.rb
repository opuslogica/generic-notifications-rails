module GenericNotificationsRails
  module Config
    class << self
      # set the "from" address on all email notifications.
      def email_from(value=nil)
        @email_from = value if value
        @email_from
      end

      # since the subject of the email likely depends on the
      # notification, and might depend on the person receiving the
      # message, it's a block that takes the notification object, and
      # has access to @email, a class variable that defines the email
      # that the message will get sent to.
      def email_subject(&blk)
        @email_subject_block = blk if blk
        @email_subject_block
      end

      def pusher_base(url=nil)
        @pusher_base = url if url
        @pusher_base
      end
    end
  end
end
