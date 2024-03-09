# Uitsmijter Buildbox

**build and test environment for Uitsmijter**

This repository contains docker images to build and 
test [Uitsmijter](https://github.com/uitsmijter/Uitsmijter). Images are public available and 
used in the [Uitsmijter Toolchain](https://docs.uitsmijter.io/contribution/tooling/).

## Overview

The resulting containers contains tools needed to build Uitsmijters incremental run unit tests.

As it is based on the official [Swift Docker image](https://hub.docker.com/_/swift) it supports all tools needed for swift development out of the box.
Additional tools are listed in [Usage](#Usage).

A second container contains all tools that are needed to run the End-To-End-tests.

## Images

| Image      | Location                             |
|------------|--------------------------------------|
| buildbox   | ghcr.io/uitsmijter/buildbox:latest   |
| e2e-runner | ghcr.io/uitsmijter/e2e-runner:latest |

## Usage

This container is intended to be used by the Uitsmijter CI and dev environment.
It is used by the provided tooling and thus does not need any direct user interaction.
It contains the following tools to further support the development and release of Uitsmijter:

Used as helpers to gather files and analyze them: `curl`, `wget`, `openssh-client`, `git`, `jq`  
Provide insights and format test results: `openjdk-17-jre`, `sqlite`

You can pull the images with the following commands: 
```shell
$ docker pull ghcr.io/uitsmijter/buildbox:latest
$ docker pull ghcr.io/uitsmijter/e2e-runner:latest
```

## Versions
Buildbox versioning correlates to a Swift Version and a Playwright Version. 

| Version | Swift Version | Playwright Version |
|---------|---------------|--------------------|
| **1.0** | 5.7.0         | -                  |
| **1.1** | 5.9.1         | -                  |
| **2.0** | 5.9.1         | 1.38.1             |
| **2.1** | 5.9.1         | 1.39.0             |
| **2.2** | 5.9.2         | 1.39.0             |
| **2.3** | 5.9.2         | 1.42.1             |


## Support
For help with the toolchain please visit our [discourse](https://discourse.uitsmijter.io) server.

## Contribution

In the interest of fostering an open and welcoming environment, we as contributors and
maintainers pledge to making participation in our project and our community a
harassment-free experience for everyone, regardless of age, body size, disability,
ethnicity, gender identity and expression, level of experience, nationality, personal
appearance, race, religion, or sexual identity and orientation.

Please read our [Code of Conduct](https://docs.uitsmijter.io/contribution/codeofconduct/)
