def sign_in_as(role_name, user = create(:user))
  role = Role.find_by_name(role_name)
  user.roles << role
  visit "/autologin?id=#{user.id}"
  user
end
