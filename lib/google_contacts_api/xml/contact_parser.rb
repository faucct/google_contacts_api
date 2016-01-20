module GoogleContactsApi
  module XML
    class ContactParser < Representable::Decorator
      include Representable::XML
      remove_namespaces!

      property :id, populator: ->(id, represented:, **) { represented.id = id.squish }
      property :title
      property :full_name, as: 'name/fullName'
      property :photo_link, as: 'link[@rel="http://schemas.google.com/contacts/2008/rel#photo"]/@href'
    end
  end
end
