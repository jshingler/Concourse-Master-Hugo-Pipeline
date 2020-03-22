#!/bin/bash

set -eu

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
export fly_target=${fly_target:-tutorial}
echo "Concourse API target ${fly_target}"
echo "Tutorial $(basename $DIR)"

pushd $DIR
  fly -t ${fly_target} set-pipeline -p mp-sample-app -c ci/pipeline.yml -l jshingler-blog.yml -n
  fly -t ${fly_target} unpause-pipeline -p mp-sample-app
  # fly -t ${fly_target} trigger-job -w -j mp-sample-app/build
popd
