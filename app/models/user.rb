class User < ActiveRecord::Base

  has_many :authentications
  has_many :photos



  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :name
  
  
  def self.find_for_twitter_oauth(omniauth)
    authentication = Authentication.find_by_provider_and_uuid(omniauth['provider'], omniauth['uid'])

    data = omniauth.extra.raw_info

    if authentication && authentication.user
    authentication.user
    else

      user = User.create!(:username => data.nickname,:name => data.name)
      user.authentications.create!(:provider => omniauth['provider'], :uuid => omniauth['uid'])
    user.save
    user
    end
  end

end
