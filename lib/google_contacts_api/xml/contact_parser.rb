module GoogleContactsApi
  module XML
    class ContactParser < Representable::Decorator
      include Representable::XML

      property :id
      property :updated
      property :given_name, as: 'gd:givenName', wrap: 'gd:name'
      property :family_name, as: 'gd:familyName', wrap: 'gd:name'
      property :full_name, as: 'gd:fullName', wrap: 'gd:name'
      property :content
      property :photo_link, as: 'link[@rel="http://schemas.google.com/contacts/2008/rel#photo"]/@href'
      property :self_link, as: 'link[@rel="self"]/@href'
      property :edit_link, as: 'link[@rel="edit"]/@href'
    end
  end
end
