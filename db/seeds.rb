# User.destroy_all
# Group.destroy_all
# Post.destroy_all
# Comment.destroy_all

@user1 = User.create(name:"user1", email:"user1@gmail.com", password:"123456", password_confirmation:"123456")
@user2 = User.create(name:"user2", email:"user2@gmail.com", password:"123456", password_confirmation:"123456")
@user3 = User.create(name:"user3", email:"user3@gmail.com", password:"123456", password_confirmation:"123456")
@user4 = User.create(name:"user4", email:"user4@gmail.com", password:"123456", password_confirmation:"123456")
p "Created #{User.count} users"

@group1 = Group.create(name:"First group", user_id:@user1.id)
@group2 = Group.create(name:"Second group", user_id:@user1.id)
@group3 = Group.create(name:"Third group", user_id:@user2.id)
@group4 = Group.create(name:"Fourth group", user_id:@user3.id)
p "Created #{Group.count} groups"


@post1 = Post.create(title:"First post", body:"First post content", user_id:@user1.id, group_id:@group1.id)
@post2 = Post.create(title:"First post", body:"First post content", user_id:@user2.id, group_id:@group1.id)
@post3 = Post.create(title:"First post", body:"First post content", user_id:@user3.id, group_id:@group1.id)
@post4 = Post.create(title:"First post", body:"First post content", user_id:@user1.id, group_id:@group2.id)

p "Created #{Post.count} posts"