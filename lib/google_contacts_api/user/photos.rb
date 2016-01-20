module GoogleContactsApi
  class User
    module Photos
      def upload_photo(contact_id, file)
        GoogleContactsApi::Photos.new(@api).upload('default', contact_id, file)
      end
    end
  end
end
