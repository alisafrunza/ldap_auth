class Ldap

	def initialize(email, password)
		@email = email
		@password = password
	end

	def bind
		connection.bind
	end

	def connection
    @connection ||= create_connection
  end

  def get_user_info
  	connection.search(
			:base => domain,
			:filter => Net::LDAP::Filter.eq("uid", username)
		).first
  end

	private

	def create_connection
		Net::LDAP.new(
		  :host => "ldap.forumsys.com",
		  :port => 389,
		  :auth => {
		  	:method => :simple,
		  	:username => sanitize_email,
		  	:password => @password
		  }
		)
	end

	def domain
		domain = @email.split("@").last.split(".")
		"dc=#{domain.first},dc=#{domain.last}"
	end

	def username
		"#{@email.split("@").first}"
	end

	def sanitize_email
    "uid=#{username},#{domain}"
  end
end
