#!/bin/bash

set -e

TESTNAME=$1
BRANCH=t-$(echo "${TESTNAME}" | sed "s/:/_/g")

if [ -n "${TESTNAME}" ] ; then
  echo "delete cache: ${RUNS_DST_DIR}/${TESTNAME}"
  rm -rf ${RUNS_DST_DIR}/${TESTNAME}

  pushd ${CODECS_SRC_DIR}/daala
  echo "remove branch from daala: ${BRANCH}"
  git branch -D ${BRANCH}
  popd
fi

node generate_list.js
