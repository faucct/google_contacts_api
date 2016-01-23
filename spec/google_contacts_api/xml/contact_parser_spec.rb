require 'spec_helper'

describe GoogleContactsApi::XML::ContactParser do
  subject { described_class.new(OpenStruct.new).from_xml(xml) }
  let(:xml) { load_file('contact.xml') }

  it do
    is_expected.to have_attributes(
                     id: 'http://www.google.com/m8/feeds/contacts/default/base/123',
                     updated: '2008-02-28T18:47:02.303Z',
                     given_name: 'New',
                     family_name: 'Name',
                     full_name: 'New Name',
                     content: 'Notes',
                     photo_link: 'https://www.google.com/m8/feeds/photos/media/default/123',
                     self_link: 'https://www.google.com/m8/feeds/contacts/default/full/123',
                     edit_link: 'https://www.google.com/m8/feeds/contacts/default/full/123',
                   )
  end
end
