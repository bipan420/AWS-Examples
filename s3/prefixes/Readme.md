# Create a bucket
```sh
aws s3 mb s3://prefixes-fun-ab-23434
```

# Create a folder 
```sh
aws s3api put-object --bucket="prefixes-fun-ab-23434" --key="hello/"
```

# Create many folders
```sh
aws s3api put-object --bucket="prefixes-fun-ab-23434" --key="hello/world/this/is/stainly/hellotxt/"
```