require 'spec_helper'

describe GoogleContactsApi::XML::ContactParser do
  subject(:contact) do
    contact = OpenStruct.new
    described_class.new(contact).from_xml(xml)
  end
  let(:xml) { <<-XML }
    <entry xmlns:gContact="http://schemas.google.com/contact/2008"
      xmlns:gd="http://schemas.google.com/g/2005"
      gd:etag="contactEtag">
      <id>
        http://www.google.com/m8/feeds/contacts/userEmail/base/contactId
      </id>
      <title>Full Name</title>
      <gd:name>
        <gd:fullName>Full Name</gd:fullName>
      </gd:name>
      <link rel="http://schemas.google.com/contacts/2008/rel#photo" type="image/*"
        href="https://www.google.com/m8/feeds/photos/media/userEmail/contactId"
        gd:etag="photoEtag"/>
      <link rel="self" type="application/atom+xml"
        href="https://www.google.com/m8/feeds/contacts/userEmail/full/contactId"/>
    </entry>
  XML

  it do
    is_expected.to have_attributes(
                     id: 'http://www.google.com/m8/feeds/contacts/userEmail/base/contactId',
                     title: 'Full Name',
                     full_name: 'Full Name',
                     photo_link: 'https://www.google.com/m8/feeds/photos/media/userEmail/contactId',
                   )
  end
end
