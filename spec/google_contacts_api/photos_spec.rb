require 'spec_helper'

describe GoogleContactsApi::Photos do
  let(:photos) { described_class.new(api) }
  let(:api) { double }

  describe '#upload' do
    subject(:upload) { photos.upload('default', 'contactId', file) }
    let(:file) do
      Tempfile.new('image').tap do |file|
        binary_file = File.open(file.path, 'wb')
        binary_file.write 'file contents'
        binary_file.close
      end
    end

    it 'uploads the file' do
      expect(api).to receive(:put) do |url, body:, headers:|
        expect(url).to eq 'photos/media/default/contactId'
        expect(body).to eq 'file contents'
        expect(headers).to eq 'Content-Type': 'image/*'

        double(body: load_file('contact_entry.xml'))
      end

      is_expected.to eq 'https://www.google.com/m8/feeds/photos/media/default/123'
    end
  end
end
