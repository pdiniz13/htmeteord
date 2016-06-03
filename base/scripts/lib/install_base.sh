#!/bin/bash
set -ex
apt-get update -y
apt-get install -y --no-install-recommends build-essential git curl unzip bzip2 ca-certificates python
