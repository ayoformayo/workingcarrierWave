
get '/' do

# @photos = Photo.all
# @photos.each do |photo|
#   if photo.small_url == nil
#     image = MiniMagick::Image.open("public/"+photo.url)
#     photo_name = photo.url.match(/(.+)(\.\w{3})/)[1]
#     photo_ext = photo.url.match(/(.+)(\.\w{3})/)[2]
#     small_url = photo_name+"_small"+photo_ext
#     photo.small_url = small_url
#     image.resize "300x300"
#     image.write "public/"+ small_url
#     photo.save
#   end
  # photo.small_url = photo.url+"_small"
 # end

erb :index
end


get '/upload' do
  # Look in app/views/index.erb
  haml :index
end

post "/upload" do 
# uploader = ImageUploader.new  
# uploader.store(params[:myfile])
p = Photo.create
  p.image = params[:myfile]
  p.save!
p p.image.url # => '/url/to/file.png'
p p.image.current_path # => 'path/to/file.png'
p p.image.identifier # => 'file.png'
redirect '/'
end

get '/sign_in' do

erb :sign_in
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @albums = @user.albums

  erb :user

end
