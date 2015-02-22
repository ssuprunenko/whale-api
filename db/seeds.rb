def get_instagram_user(uid)
  client = Instagram.client(access_token: ENV['INSTAGRAM_ACCESS_TOKEN'])
  client.user(uid)
rescue
  false
end

account = Account.create!(
  email: "user-#{rand(5)}@example.com",
  password: '123456')

3.times do
  group = account.groups.create(name: Faker::Commerce.department(1))

  5.times do
    uid = rand(1_000_000..10_000_000)
    user = get_instagram_user(uid)

    until user
      uid = rand(1_000_000..10_000_000)
      user = get_instagram_user(uid)
    end

    group.users.create(
      uid: user.id,
      username: user.username,
      name: user.full_name,
      profile_picture: user.profile_picture,
      bio: user.bio,
      website: user.website)
  end
end

