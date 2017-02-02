# codebuild-python-cryptography-custom-openssl
Example CodeBuild setup to build and bundle the Python cryptography library with a custom OpenSSL version.


## Contents

### codebuild.yml
Cloudformation template to set up CodeBuild resources to build this repo.

The __GithubSourceLocation__ parameter should be in the form of `https://<username>:<personal_token>@github.com/<path_to_repo.git>`

### buildspec.yml
CodeBuild build specification file.

### build_cryptography_custom_openssl.sh
Shell script to handle custom OpenSSL compilation and cryptography wheel build.

### lambda_entry.py
Lambda Function file; prints out the version of OpenSSL used.