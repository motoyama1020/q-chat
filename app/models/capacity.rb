class Capacity < ActiveHash::Base
  self.data = [
    {id: 0, name: '--' }, 
    {id: 1, name: '１人'}, 
    {id: 2, name: '２人'}, 
    {id: 3, name: '３人'},
    {id: 4, name: '４人'}, 
    {id: 5, name: '５人'}, 
  ]

  include ActiveHash::Associations
  has_many :rooms

end