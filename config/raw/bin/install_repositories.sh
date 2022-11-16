#!/bin/bash
mkdir -p ~/Workspace/{frbl,compsy,roqua,general,researchable}
cd ~/Workspace

github_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p $org
  cd $org
  if [ ! -d "$2" ]
  then
    git clone git@github.com:$org/$repo.git
  fi
  cd $pre
}

github_http_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p general
  cd general
  if [ ! -d "$2" ]
  then
    git clone https://github.com/$org/$repo.git
  fi
  cd $pre
}

gitlab_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  mkdir -p $org
  cd $org
  if [ ! -d "$2" ]
  then
    git clone git@gitlab.com:$org/$repo.git
  fi
  cd $pre
}

roqua_clone() {
  pre=`pwd`
  org=$1
  repo=$2
  folder=$3
  mkdir -p $folder
  cd $folder
  if [ ! -d "$2" ]
  then
    git clone git@gitlab.roqua.nl:$org/$repo.git
  fi
  cd $pre
}



github_clone "frbl" "frbl.github.io-private"
github_clone "frbl" "dotfiles-private"
github_clone "frbl" "dotfiles"
github_clone "frbl" "machine-learning-recurring-depression"
github_clone "frbl" "onlinesuperlearner"
github_clone "frbl" "vagrant-boxes"

github_clone "frbl" "tmle-time-series"
github_clone "frbl" "research-slaapproblemen-en-agitatie"
github_clone "frbl" "vars"
github_clone "frbl" "airaR"
github_clone "frbl" "thesis"
github_clone "frbl" "ecida-dev"
github_clone "frbl" "ecida-gis"
github_clone "frbl" "thesis"
github_clone "frbl" "WacChat"
github_clone "frbl" "ansible"

github_clone "compsy" "vsv"
github_clone "compsy" "paper-u-can-act-baseline"
github_clone "compsy" "vsv_api_js"
github_clone "compsy" "hoe_gek_is"
github_clone "compsy" "personalized-coaching-app"
github_clone "compsy" "backup-container"
github_clone "compsy" "dev-infrastructure"
github_clone "compsy" "evaluatieonderzoek"
github_clone "compsy" "handboek-u-can-act"
github_clone "compsy" "yourspecialforces-public"

github_clone "rug-wacc" "teachers-2018"

github_clone "rug-ds-lab" "planning-dynamic-spark"
github_clone "rug-ds-lab" "ecida-main"
github_clone "rug-ds-lab" "2018_Pratama_Low-intrusive-Power-Consumption-based-Occupancy-Detection-in-Office-Environment"

gitlab_clone "researchable" "quest-front-end"
gitlab_clone "researchable" "landingpage"
gitlab_clone "researchable" "presentations"
gitlab_clone "researchable/general" "docker"
gitlab_clone "researchable/general" "development-infrastructure"
gitlab_clone "researchable/general/management" "freedcamp-hour-counter"

# SDV
gitlab_clone "researchable/sport-data-valley/sdv" "presentation-sdv-pitch"
gitlab_clone "researchable/sport-data-valley/sdv" "sdv-infrastructure"
gitlab_clone "researchable/sport-data-valley/sdv" "sdv-poc"
gitlab_clone "researchable/sport-data-valley/sdv" "volleybal-dashboard"
gitlab_clone "researchable/sport-data-valley/sdv" "svc-loader-volleybal"
gitlab_clone "researchable/sport-data-valley/sdv" "svc-data-quality-checker"
gitlab_clone "researchable/sport-data-valley/sdv" "feature-test"

gitlab_clone "researchable/sport-data-valley/MVP" "base-platform"
gitlab_clone "researchable/sport-data-valley/MVP" "infrastructure"
gitlab_clone "researchable/sport-data-valley/MVP" "integration-tests"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-data-integrations"
gitlab_clone "researchable/sport-data-valley/MVP" "svc-questionnaires"
gitlab_clone "researchable/sport-data-valley/MVP" "jupyterhub"

gitlab_clone "sport-data-valley" "poc-data"

# i-shared
#gitlab_clone "researchable/samen-sturen" "svc-visualization-r"
gitlab_clone "researchable/samen-sturen" "svc-pdfgenerator"
gitlab_clone "researchable/samen-sturen" "svc-visualization-js"
gitlab_clone "researchable/samen-sturen" "svc-prediction"
gitlab_clone "researchable/samen-sturen" "composer"
gitlab_clone "researchable/samen-sturen" "infrastructure"

roqua_clone "researchable/general/templates/gitlab" "semantic-release"

roqua_clone "ishared" "prediction-model-r" "researchable/samen-sturen"

roqua_clone "ishared" "prediction-model-r-raw" "researchable/samen-sturen"
roqua_clone "ishared" "svc-prediction-r" "researchable/samen-sturen"
roqua_clone "ishared" "svc-visualization-r" "researchable/samen-sturen"

roqua_clone "roqua" "roqua" "roqua"


#gitlab_clone "roqua" "autovar"

# Vitens
#gitlab_clone "vitens/Nachtwacht/" "nachtwacht-core"
gitlab_clone "vitens/ecida" "ecida-poc"
gitlab_clone "vitens/ecida" "ecida-notebook-extension"
gitlab_clone "vitens/ecida" "ecida-docker-container-builder-service"
gitlab_clone "vitens/ecida" "abstract-operator"
gitlab_clone "vitens/ecida" "utilities"
gitlab_clone "vitens/ecida/templates" "base"

github_http_clone "jvm-operators" "abstract-operator"

