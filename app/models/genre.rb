class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レシピ' },
    { id: 3, name: 'テクニック' },
    { id: 4, name: '調理器具' },
    { id: 5, name: 'その他' }
  ]
end