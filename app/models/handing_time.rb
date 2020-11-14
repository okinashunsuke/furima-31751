class HandingTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1日〜２日' },
    { id: 3, name: '2日〜3日' },
    { id: 4, name: '4日〜7日' },
  ]
  include ActiveHash::Associations
  has_many :items
  end