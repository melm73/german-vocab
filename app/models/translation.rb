class Translation < ApplicationRecord
  # user: foreign key
  # word: foreign key
  # seen: boolean
  # translation: string
  # example: text
  # count: integer
  # learnt: boolean

  belongs_to :user
  belongs_to :word
  has_many :reviews

  validates :user_id, uniqueness: { scope: :word_id, message: "should only have one translation per word" }

  def self.search(word_id, user_id)
  	Translation.where(word_id: word_id, user_id: user_id)
  end
end