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
  validates :url_title, length: { maximum: 32 }
  
  private
  
    def set_message_hash
      self.message_hash = Digest::SHA3.hexdigest(Time.now.to_i.to_s + Random.rand(Time.now.to_i).to_s+Time.now.to_i.to_s, 256)
    end
    

    def url_exist?(url_string)
      begin
        url = URI.parse(url_string)
        req = Net::HTTP.new(url.host, url.port)
        req.use_ssl = (url.scheme == 'https')
        path = url.path if url.path.present?
        begin
          res = req.request_head(path || '/')
        rescue
          errors[:url] = self.url + " is not valid"
          return false
        end
        if res.kind_of?(Net::HTTPRedirection)
          url_exist?(res['location'])  
        else
          ! %W(4 5).include?(res.code[0]) 
        end
      rescue Errno::ENOENT
        errors[:url] = self.url + " is not valid"
        return false 
      end
    end
  
    def smart_check_url
      unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
        self.url = "http://#{self.url}"
      end
        self.url_title = Mechanize.new.get(self.url).title if url_exist?(self.url)
    end
  
end
