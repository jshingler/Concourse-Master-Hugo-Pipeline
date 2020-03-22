#!/bin/sh

# set -x

echo "B-U-I-L-D"
pwd

# IDEA:
#     - Embed pre-build, build, and post-build in one shell script
#     - Build functionality should look for gradlew and mvnw and run what it finds

# Pre-Build
# =============================================
echo ""
echo "Check for Pre-Build"
echo "============================================="
echo "-- Master-Pipeline - pre-build.sh"
if [ -x subject/ci/pre-build.sh ]
then
   subject/ci/pre-build.sh
else
    echo "-- Nothing to execute"
fi

# Build Hugo
# =============================================
echo ""
echo "Build"
echo "============================================="
cd subject
hugo
cd ..

# Post-Build
# =============================================
echo ""
echo "Check for Post-Build"
echo "============================================="
echo "-- Master-Pipeline - post-build.sh"
if [ -x subject/ci/post-build.sh ]
then
   subject/ci/post-build.sh
else
    echo "-- Nothing to execute"
fi

# Move Static Site
# =============================================
pwd
cp -r subject/public site
# cp the Cloud Foundry manifest file
# cp -r manifest.yml site
ls -lR
