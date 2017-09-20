#!/usr/bin/env bash

NEWMAN_ADDITIONAL_OPTIONS=${NEWMAN_ADDITIONAL_OPTIONS:-"--reporter-cli-no-summary --disable-unicode --no-color"}

# Stop on the first error
set -e;

function onExit {
    if [ "$?" != "0" ]; then
        echo "Newman tests failed!";
        exit 1
    else
        echo "Newman tests passed!";
        exit 0
    fi
}

# Call onExit when the script exits
trap onExit EXIT;

newman run "${NEWMAN_COLLECTION}" \
	--environment="${NEWMAN_ENVIRONMENT}" \
	--iteration-data="${NEWMAN_ITERATION_DATA}" \
	--iteration-count "${NEWMAN_ITERATION_COUNT}" \
	--delay-request "${NEWMAN_DELAY}" \
	${NEWMAN_ADDITIONAL_OPTIONS}

