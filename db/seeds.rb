# frozen_string_literal: true

@user1 = User.create(name: 'user1', email: 'user1@gmail.com', password: '123456', password_confirmation: '123456')
@user2 = User.create(name: 'user2', email: 'user2@gmail.com', password: '123456', password_confirmation: '123456')
@user3 = User.create(name: 'user3', email: 'user3@gmail.com', password: '123456', password_confirmation: '123456')
@user4 = User.create(name: 'user4', email: 'user4@gmail.com', password: '123456', password_confirmation: '123456')
@user5 = User.create(name: 'simplero', email: 'calvin@simplero.com', password: 'simplero',
                     password_confirmation: 'simplero')
@user6 = User.create(name: 'simplero', email: 'owais@simplero.com', password: 'simplero',
                     password_confirmation: 'simplero')

p "Created #{User.count} users"

@group1 = Group.create(name: 'First group', user_id: @user1.id)
@group2 = Group.create(name: 'Second group', user_id: @user1.id)
@group3 = Group.create(name: 'Third group', user_id: @user2.id)
@group4 = Group.create(name: 'Fourth group', user_id: @user3.id)
p "Created #{Group.count} groups"

@post1 = Post.create(title: 'First post', body: 'First post content', user_id: @user1.id, group_id: @group1.id)
@post2 = Post.create(title: 'Second post', body: 'Second post content', user_id: @user2.id, group_id: @group1.id)
@post3 = Post.create(title: 'Third post', body: 'Third post content', user_id: @user3.id, group_id: @group1.id)
@post4 = Post.create(title: 'Fourth post', body: 'Fourth post content', user_id: @user1.id, group_id: @group2.id)

p "Created #{Post.count} posts"

@comment1 = Comment.create(text: 'First comment', user_id: @user1.id, post_id: @group1.id)
@comment2 = Comment.create(text: 'Second comment', user_id: @user2.id, post_id: @group1.id)
@comment3 = Comment.create(text: 'Third comment', user_id: @user3.id, post_id: @group1.id)
@comment4 = Comment.create(text: 'Fourth comment', user_id: @user1.id, post_id: @group2.id)

p "Created #{Comment.count} comments"
