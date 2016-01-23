module GoogleContactsApi
  module XML
    class AddPhotoResponseParser < Representable::Decorator
      include Representable::XML
      remove_namespaces!

      property :id
      property :updated
      property :self_link, as: 'link[@rel="self"]/@href'
      property :edit_link, as: 'link[@rel="edit"]/@href'

      property :etag, as: 'link[@rel="edit"]/@href', populator: ->(href, represented:, **) do
        represented.etag = href.split('/').last
      end
    end
  end
end
