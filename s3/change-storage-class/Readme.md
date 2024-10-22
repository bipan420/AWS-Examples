## Create a bucket
aws s3 mb s3://change-storage-class-bb-3434

## Create a file

echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://change-storage-class-bb-3434 --storage-class STANDARD_IA

### Cleanup
aws s3 rm s3://change-storage-class-bb-3434/hello.txt
aws s3 rb s3://change-storage-class-bb-3434