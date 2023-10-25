# Uitsmijter Buildbox

Swift based build environment for Uitsmijter

## Overview

The resulting container contains all tools needed to run Uitsmijters unit tests.
As it is based on the official [Swift Docker image](https://hub.docker.com/_/swift) it supports all tools needed for swift development out of the box.
Additional tools are listed in [Usage](#Usage).

## Usage

This container is intended to be used by the Uitsmijter CI and dev environment.
It is used by the provided tooling and thus does not need any direct user interaction.
It contains the following Tools to further support the development and release of Uitsmijter:

Used as helpers to gather files and analyze them: `curl`, `wget`, `openssh-client`, `git`, `jq`  
Provide insights and format test results: `openjdk-17-jre`, `sqlite`

## Versions
Buildbox versioning correlates to a Swift Version. 

| Version | Swift Version |
|---------|---------------|
| 1.0     | 5.7.0         |
| 1.1     | 5.9.1         |



## Contribution

In the interest of fostering an open and welcoming environment, we as contributors and
maintainers pledge to making participation in our project and our community a
harassment-free experience for everyone, regardless of age, body size, disability,
ethnicity, gender identity and expression, level of experience, nationality, personal
appearance, race, religion, or sexual identity and orientation.
