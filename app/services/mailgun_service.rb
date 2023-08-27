require "uri"
require "json"
require "net/http"
require "rest-client"


class MailgunService

  MAILGUN_PRIVATE_API_KEY = ENV["MAILGUN_PRIVATE_API_KEY"]
  MAILGUN_PUBLIC_API_KEY = ENV["MAILGUN_PUBLIC_API_KEY"]
  MAILGUN_HTTP_WEBHOOK_SIGNING_KEY = ENV["MAILGUN_HTTP_WEBHOOK_SIGNING_KEY"]
  MAILGUN_SENDING_KEY = "a7cb017de487e9f03823b542224a378d-f0e50a42-efe049db"
  KEY = "096b4ca379a981e762ac4fec10181e30-f0e50a42-8ca40971"
  DOMAIN_NAME = 'sandboxad21299a5ee84e6bb7cb5565dd10c36b.mailgun.org'

  attr_reader :url

  def initialize
    @url = "https://api:#{KEY}@api.mailgun.net/v3/#{DOMAIN_NAME}"
  end

  def send_message(from: nil, to: nil, subject: nil, text: nil)
    puts "url: #{url}"

    message_url = "#{url}/messages"
    puts "message_url: #{message_url}"

    data = {
      from: "Excited User <postmaster@#{DOMAIN_NAME}>",
      to: "vega.herrera.felipe@gmail.com",
      subject: "Hello",
      text: "Testing some Mailgun awesomeness!"
    }
    puts "data: #{data}"

    RestClient.post(message_url, data)
  end

  def recovery_password(to: "vega.herrera.felipe@gmail.com", full_name: "Felipe Vega", recovery_code: "123123123")
    puts "url: #{url}"

    message_url = "#{url}/messages"
    puts "message_url: #{message_url}"

    data = {
      from: "Talento Docente <postmaster@#{DOMAIN_NAME}>",
      to: to,
      subject: "Talento Docente - Recuperar Contraseña",
      template: "password recovery",
      ":h:X-Mailgun-Variables" => {
        "full_name": full_name,
        "recovery_code": recovery_code
      }
    }
    puts "data: #{data}"

    RestClient.post(message_url, data)
  end

end
