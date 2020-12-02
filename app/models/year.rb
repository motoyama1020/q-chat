class Year < ActiveHash::Base
  self.data = [
    {id: 0, name: '--' }, 
    {id: 1, name: '2021年'}, 
    {id: 2, name: '2022年'}, 
    {id: 3, name: '2023年'},
  ]

  include ActiveHash::Associations
  has_many :rooms

end