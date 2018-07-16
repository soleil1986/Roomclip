class Daily < ApplicationRecord
  has_many :dailyclips
  accepts_nested_attributes_for :dailyclips

# dailyclip詳細画面で、前のdailyclipに進むで使用
  def previous
    Daily.order(id: :DESC).where("id < ?", id).first
  end

# dailyclip詳細画面で、次のdailyclipに進むで使用
  def next
    Daily.order(id: :ASC).where("id > ?", id).first
  end

end
