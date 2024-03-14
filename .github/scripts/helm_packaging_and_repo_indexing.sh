#!/bin/sh

HelmChartsDir="${GITHUB_WORKSPACE}/charts"       # Helm Charts Directory (files)
HelmPackagesDir="${GITHUB_WORKSPACE}/packages"   # Helm packaged Charts (.tgz)

# Package Helm Charts
ChartsList=$( find ${HelmChartsDir} -type d -maxdepth 1 | grep -v charts$ )
printf "Packaging the Helm charts ...\n"
for Chart in $( echo ${ChartsList} ); do
  helm package ${Chart} --destination ${HelmPackagesDir}
done

# Repo Index
printf "Indexing the Helm charts ...\n"
helm repo index ${HelmPackagesDir}

