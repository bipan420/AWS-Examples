# Required libraries
require 'aws-sdk-s3'   # AWS SDK for Ruby to interact with Amazon S3
require 'pry'          # Pry for debugging and introspection (not used in the code, but useful for debugging if needed)
require 'securerandom' # SecureRandom to generate unique random values

# Note: To execute this file, run the command: 'bundle exec ruby s3.rb'
# Ensure that the 'aws-sdk-s3' gem is installed and BUCKET_NAME is set as an environment variable.

# Fetching the S3 bucket name from the environment variable 'BUCKET_NAME'
bucket_name = ENV['BUCKET_NAME']

# Defining the AWS region for S3 bucket creation
region = 'ca-central-1'

# Displaying the bucket name for reference
puts bucket_name

# Initializing an S3 client using AWS SDK
client = Aws::S3::Client.new

# Creating a new S3 bucket in the specified region
resp = client.create_bucket({
  bucket: bucket_name,  # The bucket name obtained from the environment variable
  create_bucket_configuration: {
    location_constraint: region  # Specifying the region constraint for the bucket
  }
})
#binding.pry

# Generating a random number of files (between 1 and 6) to create and upload to the S3 bucket
number_of_files = 1 + rand(6) # This will generate a random number between 1 and 6
puts "number of files: #{number_of_files}"

# Iterating over the number of files and performing the file creation and upload process
number_of_files.times.each do |i|
  puts "i: #{i}"  # Output the current iteration index

  # Defining the filename and path for each file to be created
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"  # Files will be created and stored in the '/tmp' directory

  # Writing a unique random content to each file
  File.open(output_path, "w") do |f|
    f.write(SecureRandom.uuid)  # Using SecureRandom.uuid to generate a unique random string as file content
  end

  # Opening the file in read-binary mode to prepare it for uploading to S3
  File.open(output_path, "rb") do |f|
    # Uploading the file to the specified S3 bucket
    client.put_object(
      bucket: bucket_name,  # The name of the S3 bucket
      key: filename,    # The S3 object key (file name in the bucket), which can be changed to match the filename if required
      body: f               # The file content being uploaded
    )
  end
end
