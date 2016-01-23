module GoogleContactsApi
  class Photos
    def initialize(api)
      @api = api
    end

    def upload(email, contact_id, file, etag)
      response = @api.put(
        "photos/media/#{email}/#{contact_id}",
        body: File.binread(file.path),
        headers: {
          'Content-Type': 'image/*',
          'If-match': etag,
        }
      )
      XML::AddPhotoResponseParser.new(OpenStruct.new).from_xml(response.body)
    end
  end
end
