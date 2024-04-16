# Create a custom Docker image for Nextstrain

## Background

[Nextstrain's Docker image] provides software tooling that supports most use
cases, however there are times when one wants to use software that is not
included in that image. This repository demonstrates how to create your own
image.

Something similar was [requested] on the Nextstrain discussion forum.

[Nextstrain's Docker image]: https://hub.docker.com/r/nextstrain/base
[requested]: https://discussion.nextstrain.org/t/is-it-possible-to-build-a-new-docker-image-with-a-dockerfile/1391


## 1. Setup

Fork this repository, or add all its contents into an existing repository. You
will need a GitHub account to continue.


## 2. Customize the image

The [Dockerfile] defines customizations to Nextstrain's image. The method used
varies by software. Refer to [Docker Docs] or look at [Nextstrain's Dockerfile]
for examples.

Once the Dockerfile has been updated on GitHub, it will automatically trigger a
build of the image on GitHub Container Registry as an image tagged with the
repository's name and owner.

> [!NOTE]
> The first push in a repository may fail due to lack of GitHub permissions on a
> package that hasn't been created yet. Subsequent pushes should succeed.

[Dockerfile]: ./Dockerfile
[Docker Docs]: https://docs.docker.com/build/building/packaging/
[Nextstrain's Dockerfile]: https://github.com/nextstrain/docker-base/blob/master/Dockerfile


## 3. Use the image

Use the image with Nextstrain CLI by specifying it as `--image` in supported
commands. `--docker` is required if it is not your default runtime. Examples:

```sh
nextstrain build --docker --image=ghcr.io/victorlin/custom-docker .

nextstrain shell --docker --image=ghcr.io/victorlin/custom-docker .
```

> [!NOTE]
> You can also build it locally if you have Docker installed. Example:
>
> ```sh
> ./build --load --tag custom-local-image
> nextstrain shell --docker --image=custom-local-image .
> ```
