class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :avatar do
    cloudinary_transformation radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face, zoom: 0.7
  end
  # Remove everything else
end
