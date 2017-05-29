Rails.application.routes.draw do
  get  :ldap_auth, action: :index, controller: :ldap_auth
  post :connect, controller: :ldap_auth

  root to: "ldap_auth#home"
end
