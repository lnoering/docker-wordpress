<h1 align="center">lnoering/docker-wordpress</h1>

<div align="center">
  <img src="https://img.shields.io/badge/Wordpress-latest-green?logo=wordpress&longCache=true" alt="Wordpress with docker-compose" />
  <a href="https://github.com/lnoering/docker-wordpress/graphs/commit-activity" target="_blank"><img src="https://img.shields.io/badge/maintained%3F-yes-brightgreen.svg" alt="Maintained - Yes" /></a>
  <a href="https://opensource.org/licenses/MIT" target="_blank"><img src="https://img.shields.io/badge/license-MIT-blue.svg" /></a>
</div>

> Run WP with docker-compose.


## Table of contents

- [How to Use](#how-to-use)
    - [New Projects](#new-projects)
    - [Existing Projects](#existing-projects)

## How to Use

### New Projects

```bash
# Create your project directory then go into it:
mkdir -p ~/projects/wordpress
cd $_

# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/lnoering/docker-wordpress/master/lib/template | bash

# Download the version of WordPress you want to use with:
bin/download 6.2.2
# You can specify the version 
# If no arguments are passed, "6.2.2" is the default value used.

# Run the setup installer for WordPress:
bin/setup wordpress.localhost

open https://wordpress.localhost
```

### Existing Projects

```bash
# Take a backup of your existing database:
bin/mysqldump > ~/projects/existing/wordpress.sql

# Create your project directory then go into it:
mkdir -p ~/projects/wordpress
cd $_

# Download the Docker Compose template:
curl -s https://raw.githubusercontent.com/lnoering/docker-wordpress/master/lib/template | bash

# Replace with existing source code of your existing WordPress instance:
cp -R ~/projects/wordpress src
# or: git clone git@github.com:myrepo.git src

# Start some containers, copy files to them and then restart the containers:
bin/start --no-dev
bin/copytocontainer --all ## Initial copy will take a few minutes...

# Import existing database:
bin/mysql < ../existing/wordpress.sql

# Update database connection details to use the above Docker MySQL credentials:
# Also note: creds for the MySQL server are defined at startup from env/db.env
# vi src/wp-config.php
````


> Thanks to [Markshust](https://github.com/markshust/docker-magento) - I used the docker from him to do this one.

