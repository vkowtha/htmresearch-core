#!/bin/bash
# ----------------------------------------------------------------------
# Numenta Platform for Intelligent Computing (NuPIC)
# Copyright (C) 2016, Numenta, Inc.  Unless you have purchased from
# Numenta, Inc. a separate commercial license for this software code, the
# following terms and conditions apply:
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU Affero Public License for more details.
#
# You should have received a copy of the GNU Affero Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# http://numenta.org/licenses/
# ----------------------------------------------------------------------

# This script runs inside numenta's custom manylinux docker image
# quay.io/numenta/manylinux1_x86_64_centos6 and builds the non-debug manylinux
# x86_64 wide-unicode nupic.bindings wheel per PEP-513. See
# https://github.com/numenta/manylinux.
#
# ASUMPTIONS: Expects a pristine htmresearch-core source tree without any remnant
#             build artifacts from prior build attempts. Otherwise, behavior is
#             undefined.
#
# OUTPUTS: see htmresearch-core/ci/build-and-test.sh


set -o errexit
set -o xtrace

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Configure environment for manylinux build
source ${DIR}/manylinux-build-env.rc

# Build and test the manylinux wheel; see build-and-test.sh for
# destination wheelhouse
BUILD_TYPE="Release" \
WHEEL_PLAT="manylinux1_x86_64" \
  ${DIR}/../build-and-test.sh "$@"
