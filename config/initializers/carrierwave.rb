require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
      config.storage :fog
      config.fog_provider = 'fog/aws'
      config.fog_directory  = 'instalike-clone-app5'
      config.asset_host = 'https://s3.amazonaws.com/instalike-colone-app5'
      config.fog_public = false
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: 'ap-northeast-1',
      }
  end
end
