def sign_in_as(role_name, user = create(:user))
  role = Role.find_or_create_by_name(role_name)
  user.roles << role
  login_as(user, scope: :user)
  user
end


