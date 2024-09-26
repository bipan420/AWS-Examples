## Create a new s3 bucket
```md
aws s3 mb s3://checksums-examples-ab-2323
```
## Create a file that we will do a checksum on

```
echo "Hello world" > myfile.txt
```

## Get a checksum of a file for md5
```md
md5sum myfile.txt
# f0ef7081e1539ac00ef5b761b4fb01b3  myfile.txt
```

## Upload our file to s3 and look at its etag
```
aws s3 cp myfile.txt s3://checksums-examples-ab-2323
aws s3api head-object --bucket checksums-examples-ab-2323 --key myfile.txt
```

## Let's upload a file with different kind of checksum

```sh
sha1sum myfile.txt
```

```sh
aws s3api put-object \
--bucket="checksums-examples-ab-2323" \
--key="myfiesha1.txt" \
--body="myfile.txt" \
--checksum-algorithm="SHA1" \
--checksum-sha1=$(sha1sum myfile.txt | awk '{print $1}' | xxd -r -p | base64)
```