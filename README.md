# IsItIsekai.com

## Badges

Build Status, Code Coverage, PR stats/time frame, Project status, etc.

## Description

Is your favorite anime an isekai? Check at isitisekai.com!

## Purpose

Recent history has seen the anime genre of isekai explode in quantity. With this amazing growth it is hard to know if a specific show is isekai or not. Worry no longer! isitisekai.com is here to rescue you!

## Functionality

This project will tell you is an anime is of the isekai genre or not.

## Table of Contents

- [IsItIsekai.com](#isitisekaicom)
  - [Badges](#badges)
  - [Description](#description)
  - [Purpose](#purpose)
  - [Functionality](#functionality)
  - [Table of Contents](#table-of-contents)
  - [Contributing](#contributing)
    - [Code of Conduct](#code-of-conduct)
    - [Contributing Guidelines](#contributing-guidelines)
    - [Development Documentation](#development-documentation)
  - [Requirements](#requirements)
  - [How to](#how-to)
    - [Pre-Flight](#pre-flight)
    - [Run](#run)
    - [Stop](#stop)
  - [Common Errors and Fixes](#common-errors-and-fixes)
  - [Versioning](#versioning)
  - [Contributors](#contributors)
  - [Additional Information](#additional-information)

## Contributing

### Code of Conduct

Please see [CODE_OF_CONDUCT.md](./CODE_OF_CONDUCT.md).

### Contributing Guidelines

Please see [CONTRIBUTING_GUIDELINES.md](./CONTRIBUTING_GUIDELINES.md).

### Development Documentation

Please see [DEVDOCS.md](./DEVDOCS.md).

## Requirements

- POSIX terminal and a shell
- Git
- AWS CLI and access to / ability to create API credentials
- A terraform backend
  - The default Terraform Cloud is configured via ./terraform/terragrunt.hcl

## How to

### Pre-Flight

Enable remote state storage using Terraform Cloud

```sh
terraform login
```

AWS user with the following permission policy as well as the access key id and secret access key

```sh
aws configure
# access key id
# access key secret
# default region
# output format
# edit ~/.aws/configure and change the profile name to `isitisekai`
```

Clone the project from remote Git repository

```sh
# clone project
git clone git@github.com:davidjeddy/isitisekai.com.git
```

### Run

```sh
cd ./terraform/prd
terragrunt init
terragrunt plan
terragrunt apply
```

When Terraform has completed, now it is time to upload the website assets.

```sh
./lib/sync_assets.sh
```

### Stop

```sh
terragrunt destroy
```

## Common Errors and Fixes

[Common Errors and Fixes](./COMMON_ERRORS_AND_FIXES.md)

## Versioning

This project follows [SemVer 2.0](https://semver.org/).

```quote
Given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards compatible manner, and
3. PATCH version when you make backwards compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
```

## Contributors

## Additional Information

- Adding visual aids to any / all the above sections above is recommended.
- [Contributes](##Contributors) sources from [all-contributors](https://github.com/all-contributors/all-contributors).
- [ROADMAP](./ROADMAP.md) example from [all-contributors/all-contributors](https://github.com/all-contributors/all-contributors/blob/master/MAINTAINERS.md).
- Based on [README Maturity Model](https://github.com/LappleApple/feedmereadmes/blob/master/README-maturity-model.md); strive for a Level 5 `Product-oriented README`.
- This Code of Conduct is adapted from the [Contributor Covenant](https://www.contributor-covenant.org), version 2.0, available at [contributor-covenant/code_of_conduct.html](https://www.contributor-covenant.org/version/2/0/code_of_conduct.html).
- [CONTRIBUTING.md](./CONTRIBUTING.md) is based on the [Ruby on Rails Contributing](https://github.com/rails/rails/blob/master/CONTRIBUTING.md) document, credit is due to them.
- [LICENSE](./LICENSE.md) sources from:
  - [https://choosealicense.com](https://choosealicense.com)
  - [https://en.wikipedia.org/wiki/All_rights_reserved](https://en.wikipedia.org/wiki/All_rights_reserved)
- [SECURITY.md](./SECURITY.md) based from [ISARA Radiate Security Solution Suite 2.0 Security Issues](https://github.com/isaracorp/Toolkit-Samples/edit/master/SECURITY.md).
