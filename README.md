
Cache-enabled goofys docker
---

```bash
# docker run --rm --name goofys -e S3_ACCESS_KEY_ID=... -e S3_SECRET_ACCESS_KEY=... -e S3_URL=... -e S3_BUCKET=foo_bucket -e MOUNTPOINT=/mnt/foo -v /mnt/foo:/mnt/foo:shared --device /dev/fuse --privileged --cap-add SYS_ADMIN -ti goofys

# docker run --volumes-from goofys busybox ls /mnt/foo
```
