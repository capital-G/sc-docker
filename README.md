# SuperCollider Docker

> SuperCollider in a container

Provide Docker images for SuperCollider in which sclang and scsynth can be run.

**Currently this is primarily used for CI testing**, yet it is possible to use the synthesis capabilities of sclang as well.

## Quickstart

Start an interactive sclang interpreter in a docker container.

```shell
docker run -it capitalg/supercollider:tagname
```

Exit out of sclang by entering `cmd + d`.

## Tags

Tag | Base-Image | Comment
--- | --- | ---
`3.12` | `alpine-3.15` | -

## Usage

### Realtime scheduling

### Run tests in a container

Quarks can be mounted into the `/usr/local/share/SuperCollider/Extensions` folder.

```shell
docker run -v <path_to_your_quark>:/usr/local/share/SuperCollider/Extensions -it sc-docker
/usr/local/share/SuperCollider/Extensions
```

### Test a Quark with GitHub Actions


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
