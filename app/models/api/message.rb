class Api::Message < ActiveRecord::Base
  require 'digest/sha3'
  require "net/http"
      
  before_validation :set_message_hash
  before_validation :smart_check_url
  

  validates :title, presence: true, length: { minimum: 2, maximum: 64 }
  validates :message, presence: true, length: { minimum: 2, maximum: 140 }
  validates :sound,  numericality: { only_integer: true }
  validates :priority, numericality: { only_integer: true }
  validates :url, :format => URI::regexp(%w(http https)), length: { maximum: 140 }
  validates :url_title, length: { maximum: 40 }
  
  private
  
    def set_message_hash
      self.message_hash = Digest::SHA3.hexdigest(Time.now.to_i.to_s + Random.rand(Time.now.to_i).to_s+Time.now.to_i.to_s, 256)
    end
  
    def smart_check_url
      unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
        self.url = "http://#{self.url}"
      end 
      begin
        agent = Mechanize.new
        agent.user_agent_alias = 'Mac Safari'
        self.url_title = ActionView::Base.full_sanitizer.sanitize(agent.get(self.url).title[0..32]+"...")
      rescue
        errors[:url] = self.url + " is not valid"
        return false
      end
      return true
    end
  
end
