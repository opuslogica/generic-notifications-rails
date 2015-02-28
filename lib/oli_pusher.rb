module GenericNotificationsRails
  class OliPusher
    PUSHER_BASE = "http://pusher.opuslogica.com"
    PUSHER_ONE  = PUSHER_BASE + "/client/IDENTIFIER/send"
    PUSHER_MANY = PUSHER_BASE + "/send"
    
    def self.pusher_one
      base = GenericNotificationsRails.config.pusher_base || PUSHER_BASE
      base + "/client/IDENTIFIER/send"
    end

    def self.pusher_many
      base = GenericNotificationsRails.config.pusher_base || PUSHER_BASE
      base + "/send"
    end
    
    def self.send_message_notification(message, clients, sound=false)
      alert_text = "#{message.sender.message_name}: #{message.body[0..80]}"
      alert_text += "..." if alert_text.length > 80
      data = { :mid => message.id, :pid => message.project_id, :tid => message.topic.id, :dt => "message" }
      options = {}
      options = options.merge(:sound => sound)
      self.send_notification(clients, alert_text, data, options)
    end

    def self.send_notification(clients, alert_text, data, options = {})
      uri = URI.parse(self.pusher_many);
      request = Net::HTTP::Post.new(uri.path)
      request.content_type = "application/json"
      options = options.merge({ :alert => alert_text }) if alert_text
      options = options.merge({ :badge => options[:badge] }) if options[:badge]
      options = options.merge({ :client_id => $client_id }) if $client_id
      request.body = { :clients => clients, :options => options, :data => data }.to_json({})
      response = Net::HTTP.start(uri.host, uri.port) { |http| http.request(request) }
    end
  end
end
