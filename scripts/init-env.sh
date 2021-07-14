#!/usr/bin/env bash

ENV_FILE=".env"
PREFIX=$1

rm $ENV_FILE 2> /dev/null
touch $ENV_FILE

for VARIABLE in API_KEY APP_ID AUTH_DOMAIN MEASUREMENT_ID BUCKET_URL PROJECT_ID STRIPE_PUBLISHABLE_KEY BUGSNAG_API_KEY LOGROCKET_APP_ID MIXPANEL_PROJECT_TOKEN WS_RELAY_URL CODE_CHECK_URL IS_BURN
do
  ENV_NAME="${PREFIX}${VARIABLE}"
  echo "REACT_APP_${VARIABLE}="${!ENV_NAME} >> ${ENV_FILE}
done

echo "REACT_APP_BUILD_SHA1=${CIRCLE_SHA1}" >> ${ENV_FILE}
echo "REACT_APP_BUILD_TAG=${CIRCLE_TAG}" >> ${ENV_FILE}
echo "REACT_APP_BUILD_BRANCH=${CIRCLE_BRANCH}" >> ${ENV_FILE}
echo "REACT_APP_BUILD_PULL_REQUESTS=${CIRCLE_PULL_REQUESTS}" >> ${ENV_FILE}
echo "REACT_APP_BUILD_REPOSITORY_URL=${CIRCLE_REPOSITORY_URL}" >> ${ENV_FILE}