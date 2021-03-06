class Conversation < ActiveRecord::Base
  include Visibility

  belongs_to :topic
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :messages

  delegate :username, to: :author, prefix: true
  delegate :name, to: :topic, prefix: true

  def to_param
    [id, subject.parameterize].join("-")
  end

end