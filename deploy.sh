#!/bin/bash
GH_REPO="@github.com/$TRAVIS_REPO_SLUG.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git config --global user.name "Travis CI"
git config --global user.email "tim.trice@gmail.com"
git clone https://github.com/timtrice/distill.git
cd distill
git checkout master
Rscript -e 'rmarkdown::render_site(".");'

if [ ! -d "docs" ]
then
  echo "Docs directory does not exist"
  exit 1
fi

cd docs
git init
git add .
MSG="Rebuild website, $(date)"
git commit -m "$MSG"
git push --force $FULL_REPO master:gh-pages