# frozen_string_literal: true

SingleCov.covered!

RSpec.describe NotionRb::Api::Base do
  let(:subject) { NotionRb::Api::Base.new(notion_id: 'test-uuid') }

  context '#agent' do
    it 'calls agent once' do
      expect(subject.send(:agent)).to eq subject.send(:agent)
    end

    it 'has correct cookies' do
      expect(subject.send(:agent).cookie_jar.jar['www.notion.so']['/']['token_v2'].value).to eq ENV['TOKEN_V2']
    end
  end

  context '#success?' do
    it 'raises expection' do
      expect { subject.success? }.to raise_error subject.class::REDEFINE_EXCEPTION
    end
  end

  context '#call' do
    it 'raises expection' do
      expect { subject.call }.to raise_error subject.class::REDEFINE_EXCEPTION
    end
  end

  context '#response' do
    it 'raises expection' do
      expect { subject.send(:response) }.to raise_error subject.class::REDEFINE_EXCEPTION
    end
  end

  context 'abstract methods' do
    context '#url' do
      it 'raises expection' do
        expect { subject.send(:url) }.to raise_error subject.class::REDEFINE_EXCEPTION
      end
    end

    context '#params' do
      it 'raises expection' do
        expect { subject.send(:params) }.to raise_error subject.class::REDEFINE_EXCEPTION
      end
    end
  end
end
