module CodeGen
  extend ActiveSupport::Concern

  included do
    before_create :gen_code
    after_create :gen_bitly
  end

  module ClassMethods
    def unobscure_id id
      padded_id = Base64.urlsafe_decode64(id)
      padded_id[10..-1]
    end
  end

  def gen_bitly
    pub_profile_url = Rails.application.routes.url_helpers.pub_profile_url(host: 'www.read4richmond.com', id: obscure_id(self.id))
    pub_make_pledge_url = Rails.application.routes.url_helpers.pub_make_pledge_url(host: 'www.read4richmond.com', id: obscure_id(self.id))

    bitly_pub_profile_url = Bitly.client.shorten(pub_profile_url).short_url
    bitly_pub_pledge_url = Bitly.client.shorten(pub_make_pledge_url).short_url

    self.update_attributes(bitly_profile: bitly_pub_profile_url, bitly_pledge: bitly_pub_pledge_url)
  end

  private

  def gen_code
    self.code = SecureRandom.urlsafe_base64(5)
  end

  def obscure_id id
    padded_id = "#{rand.to_s[2..11]}#{id.to_s}"
    Base64.urlsafe_encode64(padded_id)
  end

end