json.array!(@api_messages) do |api_message|
  json.extract! api_message, :id, :title, :message, :sound, :priority, :url, :url_title
end
