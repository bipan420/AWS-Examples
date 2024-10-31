## Create a bucket
```sh
aws s3api create-bucket --bucket access-control-list-bucket-098 --region us-east-1
```

## Turn off block public access for ACLs
```sh
aws s3api put-public-access-block \
--bucket access-control-list-bucket-098 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

## Get the acl list for the bucket
```sh
aws s3api get-public-access-block --bucket access-control-list-bucket-098
```

## Change bucket ownership (IT will change the ownership to ACLs enabled and allow BucketOwnerPreferred for object ownership )
### Not recommended to change the ownership the ACL way
```sh
aws s3api put-bucket-ownership-controls \
--bucket access-control-list-bucket-098 \
--ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Change ACLs to allow for user in another AWS Account within the command line
```sh
aws s3api put-bucket-acl \
--bucket MyBucket 
--grant-full-control emailaddress=user1@example.com,emailaddress=user2@example.com 
--grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers
```

## Change ACLs to allow for users in another AWS Account to access the bucket using JSON
```sh
aws s3api put-bucket-acl \
--bucket MyBucket
--access-control-policy file:///workspace/AWS-Examples/s3/acls/policy.json
```

## Clean up everything

```sh
touch myfile.txt
aws s3 rm s3://access-control-list-bucket-098/myfile.txt
aws s3api delete-object --bucket access-control-list-bucket-098 --key myfile.txt

aws s3 delete-bucket --bucket access-control-list-bucket-098
```