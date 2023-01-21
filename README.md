# SuperCollider Docker

> SuperCollider in a container

[Docker Hub Site](https://hub.docker.com/r/capitalg/supercollider/tags)

[GitHub repository](https://github.com/capital-G/sc-docker)

Provide Docker images for SuperCollider in which sclang and scsynth can be run.

**Currently this is primarily used for CI testing**, yet it is possible to use the synthesis capabilities of sclang as well.

I build these images manually on MacOS x64.

## Quickstart

Start an interactive sclang interpreter in a docker container.

```shell
docker run -it capitalg/supercollider:3.12
```

Exit out of sclang by entering `cmd + d`.

## Tags

Tag | Base-Image | Comment
--- | --- | ---
`3.12` | `alpine-3.15` | -

## Usage

### Audio streaming

This is part of another project which will be open sourced soon.

### Run tests in a container

Quarks can be mounted into the `/usr/local/share/SuperCollider/Extensions` folder.

```shell
docker run -v <path_to_your_quark>:/usr/local/share/SuperCollider/Extensions -it sc-docker
```

After this simply run the tests, e.g. `TestMyLib.run`.

### Build locally

Clone this repo and execute

```shell
docker build -t sc-docker .
```

Then you can start the sclang interpreter in the container via

```shell
docker run  -it sc-docker
```

To launch into the shell use e.g.

```shell
docker run -it sc-docker /bin/sh
```

## License

GPL-2.0
