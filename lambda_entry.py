from __future__ import print_function
import sys
sys.path.append('site-packages')

from cryptography.hazmat.backends.openssl.backend import backend


def lambda_handler(event, context):
    print(backend.openssl_version_text())
