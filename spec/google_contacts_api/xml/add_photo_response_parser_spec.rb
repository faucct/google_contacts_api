require 'spec_helper'

describe GoogleContactsApi::XML::AddPhotoResponseParser do
  subject { described_class.new(OpenStruct.new).from_xml(xml) }
  let(:xml) { load_file('add_photo_response.xml') }

  it do
    is_expected.to have_attributes(
                     id: 'http://www.google.com/m8/feeds/photos/media/faucct%40gmail.com/180ff20ab5658b',
                     updated: '2016-01-23T12:17:53.454Z',
                     self_link: 'https://www.google.com/m8/feeds/photos/media/faucct%40gmail.com/180ff20ab5658b',
                     edit_link: 'https://www.google.com/m8/feeds/photos/media/faucct%40gmail.com/180ff20ab5658b/' \
                       'iKwMQVNj7GGXWAxK3ggTAg',
                     etag: 'iKwMQVNj7GGXWAxK3ggTAg',
                   )
  end
end
