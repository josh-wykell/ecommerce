CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:              'AWS',
#     aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
#     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#     region:                'us-east-1'
#   }
#     config.fog_directory  = ENV['AWS_BUCKET_NAME']
#     config.fog_public     = false
#     config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
# end
  config.storage    = :aws
  config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
  config.aws_acl    = 'public-read'
  config.asset_host = 'http://example.com'

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  config.aws_credentials = {
    access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
    region:            ENV.fetch('AWS_REGION') # Required
  }
end