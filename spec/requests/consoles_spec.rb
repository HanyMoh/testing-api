require 'rails_helper'

RSpec.describe 'Consoles requests' do
  before do
     Console.delete_all
     Console.create(name: 'NES', manufacture: 'Nintendo')
     Console.create(name: 'SNES', manufacture: 'Nintendo')
     Console.create(name: 'Wii', manufacture: 'Nintendo')
     Console.create(name: 'Genesis', manufacture: 'Sega')
     Console.create(name: 'Xbox', manufacture: 'Microsoft')
     Console.create(name: 'Switch', manufacture: 'Nintendo')
     Console.create(name: 'ps1', manufacture: 'Sony')
     Console.create(name: 'ps2', manufacture: 'Sony')
  end

  describe 'GET /consoles' do
    it "return an array of some consoles" do
      get('/consoles')
      expect(response_json['consoles']).to contain_exactly(
        'Nintendo NES',
        'Nintendo SNES',
        'Nintendo Wii',
        'Sega Genesis',
        'Microsoft Xbox',
        'Nintendo Switch',
        'Sony ps1',
        'Sony ps2'
      )
    end

    it "supports specifying consoles for a specific manufacture" do
      get('/consoles', params: {manufacture: 'Nintendo'})
      expect(response_json['consoles']).to contain_exactly(
        'Nintendo NES',
        'Nintendo SNES',
        'Nintendo Wii',
        'Nintendo Switch'
      )
    end
  end
end
