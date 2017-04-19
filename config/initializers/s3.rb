#require 'carrierwave/storage/abstract'
#require 'carrierwave/storage/file'
#require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
      #:provider               => 'AWS',
      #:aws_access_key_id      => 'AKIAJAHPV664UZNL5Q4A',
      #:aws_secret_access_key  => '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',
      #:region                 => 'us-west-1', # Change this for different AWS region. Default is 'us-east-1'
      #:path_style             => true
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET_KEY'],
      :region                 => ENV['S3_REGION'], # Change this for different AWS region. Default is 'us-east-1'
      :path_style             => true

      }
  config.fog_directory  = ENV['S3_BUCKET']
end


#heroku config:set S3_ACCESS_KEY="AKIAJAHPV664UZNL5Q4A"
#heroku config:set S3_SECRET_KEY="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"
#heroku config:set S3_BUCKET="rorproject"
#heroku config:set S3_REGION="us-west-1"

#export S3_ACCESS_KEY="AKIAJAHPV664UZNL5Q4A"
#export S3_SECRET_KEY="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"
#export S3_BUCKET="rorproject"
#export S3_REGION="us-west-1"