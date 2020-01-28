#!/bin/bash

#when you run a script, it will show all actions done in that script
# set -x

#causes the shell to exit if any subcommand or pipeline returns a non-zero status.
set -e

# get system nmae
heroku_env=`heroku config:get SYSTEM_NAME`

# get branch namme
branch=`git branch | egrep '^\*' | awk '{print $2}'`

# confirm they want to do the push
echo "WARNING: Do you want to push from branch: $branch to $heroku_env?"
read answer

if [ "$answer" != "y" ]; then
  echo "bailing for non-y answer"
  exit 1
fi

# set destination name name
if [ "$branch" != "master" ]; then
  dest="${branch}:master"
else
  dest=master
fi

# get the heroku remote
remote=`grep -A2 'remote "heroku"' .git/config | grep 'url =' | awk -F: '{print $2}'`

# Get the current state of heroku
git pull heroku master

# Get the current state of the branch you want to push to heroku
git pull origin $branch

# Get migrations
set +e
migrations=`git diff heroku/master | egrep -c 'db/migrate'`
set -e

if [ $migrations -gt 0 ]; then
    rake slack:send_critical_alert["The $heroku_env environment is going in to maintenance mode in a few seconds to update our database and should be back up real soon..."]
fi

# run latest bundle install
bundle install

# push the code to heroku
# add -f to force it
git push heroku $dest

# after the code is updated, then run the migrations
if [ $migrations -gt 0 ]; then

  rake slack:send_critical_alert["The $heroku_env environment is going down now and should be back up soon..."]

  # turn down the system
  heroku maintenance:on
  heroku ps:scale worker=0

  # run the migrations
  heroku run rake db:migrate

  # turn the system back on
  heroku ps:scale worker=1
  heroku maintenance:off

fi

# restart the sytem just in case something was missed
heroku restart

rake slack:send_critical_alert["The update to $heroku_env environment is done and the system should be back up now. Let us know ASAP if you notice any big issues."]

exit 0
