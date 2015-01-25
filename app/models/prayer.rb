class Prayer < ActiveRecord::Base
  validates :body, :user, presence: true

  belongs_to :user

  def author
    anonymous? ? "Anonymous" : self.user.name
  end
end
