class Endpoint < ActiveRecord::Base
  validates_presence_of :signature

  before_validation :generate_signature

  def generate_signature
    self.signature = SecureRandom.urlsafe_base64(16) if signature.blank?
  end
end
