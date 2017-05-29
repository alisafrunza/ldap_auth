class LdapAuthController < ApplicationController

	def connect
		if ldap.bind
			@user_info = ldap.get_user_info
			flash[:success] = ldap.connection.get_operation_result.message
			redirect_to root_path
		else
			flash[:error] = ldap.connection.get_operation_result.message
			redirect_to ldap_auth_path
		end
	end

	private

	def ldap
    @ldap ||= Ldap.new(params[:email], params[:password])
  end
end



