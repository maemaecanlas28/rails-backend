puts "Seeding..."

user1 = User.create(name: "Charlie Brown", username: "Snoopy", email: Faker::Internet.free_email, password: "12345678", date_of_birth: DateTime.new(1990, 5, 8), gender: "Male" )
user2 = User.create(name: "Sherlock Holmes", username: "221B", email: Faker::Internet.free_email, password: "12345678", date_of_birth: DateTime.new(1985, 4, 12), gender: "Male")
user3 = User.create(name: "John Watson", username: "TheDoctor", email: Faker::Internet.free_email, password: "12345678", date_of_birth: DateTime.new(1987, 10, 11), gender: "Male")
user4 = User.create(name: "Arya Stark", username: "Has_No_Name", email: Faker::Internet.free_email, password: "ABC12345678!", date_of_birth: DateTime.new(1980, 12, 29), gender: "Female")
user5 = User.create(name: "Jon Snow", username: "Ice_and_Fire", email: Faker::Internet.free_email, password: "ABC12345678!", date_of_birth: DateTime.new(1996, 3, 16), gender: "Male")


board1 = Board.create(title: "Who is the best ADC?", description: "Is Doublelift better than Sneaky?", category: "eSports", end_date: DateTime.new(2022, 10, 21), tags: ["LCS", "ADC", "Riot", "GGEZ"], user_id: user3.id)
board2 = Board.create(title: "Which is the best LCS team?", description: "Did C9 deserve to win the LCS championship?", category: "eSports", end_date: DateTime.new(2022, 10, 21), tags: ["LCS", "Worlds2022", "RiotGames", "MOBA"], user_id: user2.id)

option1 = Option.create(name: "Doublelift", score: 0, board_id: board1.id)
option2 = Option.create(name: "Sneaky", score: 0, board_id: board1.id)

option3 = Option.create(name: "Cloud9", score: 0, board_id: board2.id)
option4 = Option.create(name: "100Thieves", score: 0, board_id: board2.id)
option5 = Option.create(name: "Evil Geniuses", score: 0, board_id: board2.id)
option6 = Option.create(name: "Team Liquid", score: 0, board_id: board2.id)

Follower.create(user_id: user1.id, follower_id: user2.id)
Follower.create(user_id: user1.id, follower_id: user3.id)
Follower.create(user_id: user2.id, follower_id: user5.id)
Follower.create(user_id: user2.id, follower_id: user1.id)
Follower.create(user_id: user4.id, follower_id: user1.id)
Follower.create(user_id: user3.id, follower_id: user2.id)
Follower.create(user_id: user4.id, follower_id: user5.id)
Follower.create(user_id: user2.id, follower_id: user5.id)

comment1 = Comment.create(message: Faker::Hipster.paragraph(sentence_count: 1), board_id: board1.id, user_id: user1.id)
comment2 = Comment.create(message: Faker::Hipster.paragraph(sentence_count: 1), board_id: board1.id, user_id: user2.id)
comment3 = Comment.create(message: Faker::Hipster.paragraph(sentence_count: 1), board_id: board1.id, user_id: user5.id)
comment4 = Comment.create(message: Faker::Hipster.paragraph(sentence_count: 1), board_id: board2.id, user_id: user3.id)
comment5 = Comment.create(message: Faker::Hipster.paragraph(sentence_count: 1), board_id: board2.id, user_id: user1.id)
comment6 = Comment.create(message: Faker::Hipster.paragraph(sentence_count: 1), board_id: board2.id, user_id: user2.id)

puts "Finished seeding!"