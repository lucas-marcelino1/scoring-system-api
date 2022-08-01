require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'name' do
      user = User.create(name:'', email: "rodolfo@email.com", password: "1234567",
                         phone: '(47) 9 9474-7178', city: 'Pomerode', address: 'Rua Mafra, 247')
      result = user.valid?
      expect(result).to be false
    end
    
    it 'format of email' do
      user = User.create(name: 'Rodolfo', email: "rodolfo", password: "1234567",
                         phone: '(47) 9 9474-7178', city: 'Pomerode', address: 'Rua Mafra, 247')
      result = user.valid?
      expect(result).to be false
    end

    it 'presence of phone' do
      user = User.create(name: 'Rodolfo', email: "rodolfo@email.com", password: "1234567",
                         phone: '', city: 'Pomerode', address: 'Rua Mafra, 247')
      result = user.valid?
      expect(result).to be false
    end

    it 'presence of city' do
      user = User.create(name: 'Rodolfo', email: "rodolfo@email.com", password: "1234567",
                         phone: '(47) 9 9474-7178', city: '', address: 'Rua Mafra, 247')
      result = user.valid?
      expect(result).to be false
    end

    it 'presence of address' do
      user = User.create(name: 'Rodolfo', email: "rodolfo@email.com", password: "1234567",
                         phone: '(47) 9 9474-7178', city: 'Pomerode', address: '')
      result = user.valid?
      expect(result).to be false
    end
  end
end
