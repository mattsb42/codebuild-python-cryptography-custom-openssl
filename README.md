# codebuild-python-cryptography-custom-openssl
Example CodeBuild setup to build and bundle the Python [cryptography library](
https://cryptography.io/) with a custom
OpenSSL version for deployment to AWS Lambda.

As of this writing, the default Lambda runtime includes OpenSSL 1.0.1k-fips.
There are many use cases where a newer version of OpenSSL is desirable, but this is complicated
both by the build required as well as the integration of that specific build with the [cryptography
library](https://cryptography.io/).

This repository contains example resources to use the AWS CodeBuild service to build a Lambda
deployable zip file which contains the cryptography library built against a specific desired
version of OpenSSL.

Built libraries are built into a "site-packages" directory, which must be added to `sys.path`
in the Lambda Python module referencing those libraries.

The `OPENSSL_VERSION` environment variable can be set to the desired OpenSSL version.  In the supplied
build script, it defaults to `1.1.0d`.

## Contents

### codebuild.yml
Cloudformation template to set up CodeBuild resources to build this repo.

The __GithubSourceLocation__ parameter should be in the form of `https://<username>:<personal_token>@github.com/<path_to_repo.git>`

### buildspec.yml
CodeBuild build specification file.

### build_cryptography_custom_openssl.sh
Shell script to handle custom OpenSSL compilation and cryptography wheel build.

### lambda_entry.py
Lambda Function code.  Prints out the version of OpenSSL used.