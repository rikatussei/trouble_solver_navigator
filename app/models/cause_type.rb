class CauseType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '機械故障' },
    { id: 3, name: '電気故障' },
    { id: 4, name: '定期点検' },
    { id: 5, name: '臨時点検' },
    { id: 6, name: '資材購入' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :events

  end