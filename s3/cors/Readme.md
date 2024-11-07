## Create first bucket
```sh
aws s3api create-bucket --bucket my-cors-experiment-5857 --region us-east-1
```
## Change block public access
```sh
aws s3api put-public-access-block \
--bucket my-cors-experiment-5857 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy
```sh
aws s3api put-bucket-policy --bucket my-cors-experiment-5857 --policy file://bucket-policy.json
```

## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket my-cors-experiment-5857 --website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross-origin
### Don't forget to use --content-type when using s3api to upload.
```sh
aws s3api put-object --bucket my-cors-experiment-5857 --key index.html --body index.html --content-type text/html


aws s3 cp index.html s3://my-cors-experiment-5857
```

## View the website and see if index.html is there
```sh
https://my-cors-experiment-5857.s3.us-east-1.amazonaws.com/index.html
```
## Apply a CORS policy


## Create Second bucket for cors experiment. First approach we did of using third party font did not give cors issue

```sh
aws s3api create-bucket --bucket my-cors2-experiment-5857
```

## Change block public access
```sh
aws s3api put-public-access-block \
--bucket my-cors2-experiment-5857 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create the bucket policy
```sh
aws s3api put-bucket-policy --bucket my-cors2-experiment-5857 --policy file://bucket-policy2.json
```
## Turn on static website hosting
```sh
aws s3api put-bucket-website --bucket my-cors2-experiment-5857 --website-configuration file://website.json
```

## Upload the js file to the bucket
```sh
aws s3api put-object --bucket my-cors2-experiment-5857 --key hello.js --body hello.js --content-type text/js
```

## View the js file 
```sh
https://my-cors2-experiment-5857.s3.us-east-1.amazonaws.com/hello.js
```
