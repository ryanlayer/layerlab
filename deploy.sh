#!/bin/bash
export JEKYLL_ENV=production
bundle exec jekyll build
rsync -avz -e "ssh -p 2222" _site/ ryanlaye@layerlab.org:public_html/
