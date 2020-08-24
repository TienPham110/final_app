########################Feeds#############################

#get public photo in reverse chronological order

Photo.where(shared: true).order(created_at: :desc)

#get private photo in reverse chronological order

Photo.where(shared: false).order(created_at: :desc)

#get public album in reverse chronological order

Album.where(shared: true).order(created_at: :desc)

#get private album in reverse chronological order

Album.where(shared: false).order(created_at: :desc)

#get title of photo of user has id = 2

Photo.find_by(user_id:2).title

#get description of photo of user has id = 2

Photo.find_by(user_id:2).description

#get title of album of user has id = 2

Album.find_by(user_id:2).title

#get description of album of user has id = 2

Album.find_by(user_id:2).description

#get name of user has id = 2

User.find_by(user_id:2).firstName
User.find_by(user_id:2).lastName


#######################Dicovery#########################

#get public photo in reverse chronological order

Photo.where(shared: true).order(created_at: :desc)

#get private photo in reverse chronological order

Photo.where(shared: false).order(created_at: :desc)

#get public album in reverse chronological order

Album.where(shared: true).order(created_at: :desc)

#get private album in reverse chronological order

Album.where(shared: false).order(created_at: :desc)

#get title of photo of user has id = 2

Photo.find_by(user_id:2).title

#get description of photo of user has id = 2

Photo.find_by(user_id:2).description

#get title of album of user has id = 2

Album.find_by(user_id:2).title

#get description of album of user has id = 2

Album.find_by(user_id:2).description

#get name of user has id = 2

User.find_by(user_id:2).firstName
User.find_by(user_id:2).lastName

#######################TabPhotos########################

#get public photo in reverse chronological order

Photo.where(shared: true).order(created_at: :desc)

#get private photo in reverse chronological order

Photo.where(shared: false).order(created_at: :desc)

#get number of  photo

User.count


########################TabAlbums######################

#get public album in reverse chronological order

Album.where(shared: true).order(created_at: :desc)

#get private album in reverse chronological order

Album.where(shared: false).order(created_at: :desc)

#get number of album

Album.count

#####################TabFollowings####################

#get number of my followings

User.first.followings.count

#get all firstName of all users who following

User.followings.map(&:firstName)

#get all avatar of all user who following
User.followings.map(&:avatarFileName)

#get number of following of following user
User.followings.count

#get  number of follower of following user
User.followers.count

#####################TabFollowers####################

#get number of my followers

User.first.followers.count

#get all firstName of all users who following

User.followings.map(&:firstName)

#get all avatar of all user who following
User.followings.map(&:avatarFileName)

#get number of following of followers user
User.followings.count

#get  number of follower of followers user
User.followers.count

#####################NewPhotos#####################

#set title for photo
@photo.title = @title

#set description for photo
@photo.description = @description

#set sharing mode for photo
@photo.shared = @shared

#set photo Name for photo
@photo.photoFileName = @photoFileName

#set photo size for photo
@photo.photoFileSize = @photoFileSize

#set photo type for photo
@photo.photoType = @photoType


#####################NewAlbums######################

#set title for album
@album.title = @title

#set description for album
@album.description = @description

#set sharing mode for album
@album.shared = @shared

#####################EditProfileUser#################

#set first name
User.first.firstName = @firstName

#set last name
User.first.lastName = @lastName

#set email 
User.first.email = @email

#set Password
User.first.password = @password

#######################ManagePhotos#########################

#get public photo in reverse chronological order

Photo.where(shared: true).order(created_at: :desc)

#get private photo in reverse chronological order

Photo.where(shared: false).order(created_at: :desc)

#get title of photo of user has id = 2

Photo.find_by(user_id:2).title

#get description of photo of user has id = 2

Photo.find_by(user_id:2).description

#####################ManageAlbum####################

#get public album in reverse chronological order

Album.where(shared: true).order(created_at: :desc)

#get private album in reverse chronological order

Album.where(shared: false).order(created_at: :desc)

#get title of album of user has id = 2

Album.find_by(user_id:2).title

#get description of album of user has id = 2

Album.find_by(user_id:2).description

######################ManageUser###################

#get user's first name
User.all.map(&:first_name)

#get user's last name
User.all.map(&:last_name)

#get user's email address
User.all.map(&:email)

#get user's last login
User.all.map(&:lastLogin)
