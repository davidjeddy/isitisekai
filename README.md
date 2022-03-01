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
    - [Configure](#configure)
    - [Run](#run)
    - [Test](#test)
    - [Update](#update)
    - [Stop / Destroy](#stop--destroy)
  - [Common Errors and Fixes](#common-errors-and-fixes)
  - [Versioning](#versioning)
  - [References and Sources](#references-and-sources)
    - [CSS](#css)
    - [Terraform](#terraform)
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

- [POSIX terminal](https://en.wikipedia.org/wiki/POSIX_terminal_interface) and a shell
- [Git](https://git-scm.com/)
- [AWS CLI](https://aws.amazon.com/cli/)
  - [IAM user API id and key](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)
  - [IAM user with permissions](./libs/iam_user_policy.json)
- [Terraform Cloud](https://cloud.hashicorp.com/products/terraform)
- [Terraform](https://www.terraform.io/) >=1.1.6
- [Terragrunt](https://terragrunt.gruntwork.io/) >=0.36
- [tfsec](https://github.com/aquasecurity/tfsec)
- [k6 open source](https://k6.io/open-source/)

## How to

### Pre-Flight

Enable remote state storage using Terraform Cloud

```sh
terraform login
```

Clone the project from remote Git repository

```sh
# clone project
git clone git@github.com:davidjeddy/isitisekai.com.git
```

### Configure

```sh
cp ./terraform/prd/terraform.tfenv.dist ./terraform/prd/terraform.tfenv
vi ./terraform/prd/terraform.tfenv
# add appropriate values
```

### Run

```sh
cd ./terraform/prd
terragrunt init
terragrunt plan
terragrunt apply
# `yes` [ENTER] when prompted
```

### Test

```sh
k6 run -e HOSTNAME=isitisekai.com ./test/k6/get.js
```

### Update

```sh
terragrunt plan
# check the listed changes
terragrunt apply
# `yes` then [ENTER] when prompted
```

Also, after updating resources stored in S3 you must trigger a CloudFront Distribution invalidation to get the changes to display at the URL.

### Stop / Destroy

```sh
cd ./terraform/prd
terragrunt destroy
# `yes` [ENTER] when prompted
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

## References and Sources

### CSS

- <https://www.freecodecamp.org/news/how-to-center-anything-with-css-align-a-div-text-and-more/>
- <https://caniuse.com/?search=vh>
- <https://animejs.com/>
- <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random>
- <https://www.imgonline.com.ua/eng/make-jpeg-progressive-without-compression.php>
- <https://www.w3schools.com/cssref/pr_background-position.asp>

### Terraform

- <https://stackoverflow.com/questions/57456167/uploading-multiple-files-in-aws-s3-from-terraform>

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
