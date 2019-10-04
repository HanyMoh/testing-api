require 'rails_helper'

RSpec.describe Console do
  subject { described_class.create(manufacture: 'Nintendo', name: 'Wii') }

  describe 'validations' do
    describe 'name' do
      it 'Must be present' do
        expect(subject).to be_valid
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end

    describe 'manufacture' do
      it 'must be present' do
        expect(subject).to be_valid
        subject.manufacture = nil
        expect(subject).to_not be_valid
      end
    end

    describe '#formatted_name' do
      it 'return the manufacture and name in a string' do
        expect(subject.formatted_name).to eql('Nintendo Wii')
      end
    end

    describe '.nintendo' do
      it 'return an ActiveRecord::Relation of console manufactured by Nintendo' do
        described_class.delete_all
        wii = described_class.create(manufacture: 'Nintendo', name: 'Wii')
        switch = described_class.create(manufacture: 'Nintendo', name: 'Switch')
        described_class.create(manufacture: 'Sony', name: 'PS4')

        expect(described_class.nintendo).to contain_exactly(
          wii,
          switch
        )
      end
    end
  end
end
