CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: "ca-central-1",
    # endpoint: "https://whattoeat.s3.ca-central-1.amazonaws.com",
    # host: "https://whattoeat.s3.ca-central-1.amazonaws.com"
  }
  config.fog_directory = "whattoeat"
  config.fog_public = true
end
