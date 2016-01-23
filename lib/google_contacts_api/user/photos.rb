module GoogleContactsApi
  class User
    module Photos
      def upload_photo(contact_id, file, etag)
        GoogleContactsApi::Photos.new(@api).upload('default', contact_id, file, etag)
      end
    end
  end
end
