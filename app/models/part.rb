class Part < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ソプラノ' },
    { id: 3, name: 'アルト' },
    { id: 4, name: 'テノール' },
    { id: 5, name: 'バス' }
  ]

  include ActiveHash::Associations
  has_many :members
end
