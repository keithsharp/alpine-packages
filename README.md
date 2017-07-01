# Alpine Linux Packages
This repository contains packages I have created for [Alpine Linux](https://www.alpinelinux.org).  Alpine Linux is frequently used as a lightweight base distribution for [Docker](https://www.docker.com) containers.

You should be able to build a particular package by building a container based on the [Dockerfile](https://github.com/keithsharp/alpine-packages/blob/master/Dockerfile) in this repository and then

```
docker build --rm -t <username>/abuild .
```

You can then build a package, for example [grpc](https://github.com/keithsharp/alpine-packages/blob/master/grpc), like this:
```
docker run --rm -ti --name abuild <username>/abuild
abuild-keygen -a
cd grpc
abuild -r
ls /packages/builder/x86_64/
```

That last `ls` should show the `grpc-1.4.1-r0.apk` and `grpc-dev-1.4.1-r0.apk` packages.

There a couple of things left as an exercise for the reader:

1. Rather than generating a new key each time you run the container it would be better to use an actual key!
2. It would make more sense to mount /packages as a volume so that the created packages lived on after you exit the container.

Pull requests welcome!

## Contact
Keith Sharp, &lt;[kms@passback.co.uk](mailto:kms@passback.co.uk)&gt;
