require './lib/attendee'

describe Attendee do

  let(:attendee) { Attendee.new(name: 'Megan', budget: '$50') }

  describe 'initialization' do
    it 'exists' do
      expect(attendee).to be_instance_of Attendee
    end
  end

  describe '#name' do
    it 'returns the name'
      expect(attendee.name).to eq 'Megan'
    end
  end

  describe '#budget' do
    it 'returns the budget'
      expect(attendee.budget).to eq '50'
    end
  end
  
end