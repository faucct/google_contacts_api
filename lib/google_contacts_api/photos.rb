module GoogleContactsApi
  class Photos
    def initialize(api)
      @api = api
    end

    def upload(email, contact_id, file)
      response = @api.put(
        "photos/media/#{email}/#{contact_id}",
        body: File.binread(file.path),
        headers: {
          'Content-Type': 'image/*',
        }
      )
      contact = OpenStruct.new
      XML::ContactParser.new(contact).from_xml(response.body)
      contact.photo_link
    end
  end
end
