require 'rails_helper'

RSpec.describe 'Consoles requests' do
  let(:response_json){ JSON.parse(response.body)}

  describe 'GET /consoles' do
    it "return an array of some consoles" do
      get('/consoles')
      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Genesis',
        'Xbox',
        'Switch',
        'ps1',
        'ps2'
      )
    end

    it "supports specifying consoles for a specific manufacture" do
      get('/consoles', params: {manufacture: 'Nintendo'})
      expect(response_json['consoles']).to contain_exactly(
        'NES',
        'SNES',
        'Wii',
        'Switch'
      )
    end
  end
end
