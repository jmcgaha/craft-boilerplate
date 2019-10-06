# Craft Boilerplate
This project is based on the official [Craft 3 starter project](https://github.com/craftcms/craft/)

Table of Contents
=================
* [Environment Considerations](#environment-considerations)
  * [xcode Installation](#mac-osx-only-xcode-installation)
  * [MAMP Installation](#mamp-installation)
  * [Composer Installation](#composer-installation)
  * [Node Installation](#node-installation)
* [New Project Setup](#new-project-setup)
* [Miscellaneous Information](#miscellaneous-information)
* [Project Specific Information](#project-specific-information)
* [About Craft CMS](#about-craft-cms)


## (Mac OSX only) xcode Installation

Run: `$ xcode-select --install` and follow the instructions. It can take a few minutes to install.


## MAMP Installation

You can download MAMP [here](https://www.mamp.info/en/downloads/) and find the installation instructions [here](https://documentation.mamp.info/).


## Composer Installation

CraftCMS v3 now uses [PHP Composer](https://getcomposer.org/) to manage Craft updates, plugins, and other things related to CraftCMS. While there are [installation instructions](https://getcomposer.org/doc/00-intro.md) for various operating systems, we have found that the most common setup (i.e. MacOSX and Ubuntu Linux) can be installed by doing the following:

1. Ensure that you have PHP installed
1. Download and save the Composer installer here: https://getcomposer.org/installer
1. Open a terminal and go to the directory in which you saved the Composer installer.
1. Run the following command from the terminal in order to install Composer globally (assuming the file you downloaded and saved is named "installer":<br /> `$ php installer --install-dir=/usr/local/bin --filename=composer`
1. Run `$ composer --version` to verify that the installation was successful.

If all goes well and you were able to install Composer globally, then this is the only time you will have to install Composer.


## Node installation

CraftCMS v3 projects based on `craft-boilerplate` utilize `nodejs`, `npm`, and `laravel mix`, in order to run SASS processing, javascript minifcation, and autoprefixing.

Find out how to download and install `node` for your environment here (which includes `npm`): https://nodejs.org/en/download/


# New Project Setup

Follow these instructions when you need to start a brand new CraftCMS from scratch, utilizing this bootstrap project as a foundation and a starting point.

## New Project Setup
1. Ensure that you have installed all required software - see [Environment Considerations](#environment-considerations)
1. Download the latest archive master version of the craft-boilerplate project, found [here](https://github.com/jmcgaha/craft-boilerplate/archive/master.zip)
1. Create a new directory for the new project and unzip the craft-boilerplate archive into this directory.
1. Open up a terminal and change the directory where you unzipped the archive above.
1. Run `$ composer install --no-scripts`, which will download Craft and all associated plugins.
1. Run `$ composer run-script post-create-project-cmd`, which will guide you through the "CraftCMS Initialization" steps that ultimately create an .env file and set your security key.
1. Add a new site/database to MAMP and make sure a database is available for Craft to be installed into.
1. MAMP users need to make sure and uncomment a line in the `.env` for `BACKUP_COMMAND`, `RESTORE_COMMAND`, and `DB_SOCKET`
1. Run `$ ./craft setup` and follow the instructions, which will fill out the rest of the fields in your .env file and set up the database for first-time use.
1. Run `$ npm install`, which will install all Node dependencies for this project.

# Miscellaneous Information
### File/Directory Structure

This CraftCMS project expects certain files to be in specific locations in order to be used.

* [assets/](assets/) - Parent directory where javascripts/sass files are stored
  * [assets/javascript/](assets/javascript/) - Your project's javascript files go here.
  * [assets/sass/](assets/sass/) - Your project's SASS files go here ([Tailwind CSS](https://github.com/tailwindcss/tailwindcss) by default).
* [config/](config/) - Parent directory which holds configuration files
  * [config/db.php](config/db.php) - Database configuration, but mostly pulled from `.env`
  * [config/general.php](config/general.php) - General CraftCMS configuration file
  * [config/license.key](config/license.key) - License key that gets generated upon site bootstrap.
  * [config/project.yaml](config/project.yaml) - Project Config settings to help sync your fields/sections/settings across environments.
* [modules/](modules/) - Holds any custom Yii modules you might be using
* [public/](public/) - Project's site root according to your webserver
  * [public/images/](public/images/) - Project's non-asset images are stored here (git controlled)
  * [public/index.php](public/index.php) - Root PHP file read by the webserver
  * [public/uploads/](public/uploads/) - Parent directory for all uploaded assets (not git controlled)
  * [public/assets/](public/assets/) - **Compiled** assets (js/sass/etc) get put here (not git controlled)
* [scripts/](scripts/) - Utility shell scripts to perform various functions
* [storage/](storage/) - CraftCMS dynamically generated files, such as logs and backups.
* [templates/](templates/) - The location for all Twig templates
* [.env.example](.env.example) - Example `.env` file
* [composer.json](composer.json) - PHP Composer configuration file
* [composer.lock](composer.lock) - PHP Composer package information lock file
* [craft](craft) - CraftCMS PHP console application
* [craft.bat](craft.bat) - CraftCMS console loader for Windows
* [favicon.js](favicon.js) - Automated utility for saving favicon and other files like that
* [tailwind.config.js](tailwind.config.js) - Tailwind css configuration
* [webpack.mix.js](webpack.mix.js) - Laravel Mix configuration (sass/js compilation, etc)
* [package.json](package.json) - npm packages configuration file
* [package-lock.json](package-lock.json) - npm packages information lock file

More detailed information about the default structure can be found here: https://docs.craftcms.com/v3/directory-structure.html

### .env
 - Database and environment name are set in the .env file when you craft setup
 - This file is not tracked in git, helping to keep passwords more secure

### [Nginx](https://github.com/nystudio107/nginx-craft)
 - My development environment is setup using apache which I find a tad simpler to work with locally
 - Refer to this repo if the staging/prod environment is not using our setup scripts
 - It may be a little heavy handed so an alternative with the least amount of required bits is [here](https://craftcms.stackexchange.com/a/980/107)

### NPM/Laravel Mix
 - Laravel Mix makes webpack implementation very easy and has a fairly basic setup for Sass and JS merging

### Database
 - No database is included.
 - Add a blank database to your local host and then fill in the details of that when running `./craft setup`
 - Go to yourdomain.test/admin and craft will install a new version into that empty database

### SASS
 - [Tailwind CSS](https://github.com/tailwindcss/tailwindcss) is included in the project

### [Craft Scripts](https://github.com/nystudio107/craft-scripts)
 - Use these scripts to pull down db and assets
 - Change the settings in the `/scripts/.env.sh` file to match your local machine and the remote server

<hr style="margin: 80px 0;">

<p align="center"><a href="https://craftcms.com/" target="_blank"><img width="312" height="90" src="https://craftcms.com/craftcms.svg" alt="Craft CMS"></a></p>

## About Craft CMS

Craft is a flexible and scalable CMS for creating bespoke digital experiences on the web and beyond.

It features:

- An intuitive Control Panel for administration tasks and content creation.
- A clean-slate approach to content modeling and [front-end development](https://docs.craftcms.com/v3/dev/).
- A built-in Plugin Store with hundreds of free and commercial [plugins](https://plugins.craftcms.com/).
- A robust framework for [module and plugin development](https://docs.craftcms.com/v3/extend/).

Learn more about it at [craftcms.com](https://craftcms.com).

## Tech Specs

Craft is written in PHP (7+), and built on the [Yii 2 framework](https://www.yiiframework.com/). It can connect to MySQL (5.5+) and PostgreSQL (9.5+) for content storage.

<!--## Installation

See the following documentation pages for help installing Craft 3:

- [Server Requirements](https://docs.craftcms.com/v3/requirements.html)
- [Installation Instructions](https://docs.craftcms.com/v3/installation.html)
- [Upgrading from Craft 2](https://docs.craftcms.com/v3/upgrade.html)-->

## Resources

#### Official Resources
- [Documentation](https://docs.craftcms.com/v3/) – Everything from usage instructions to plugin guides. 
- [Class Reference](https://docs.craftcms.com/api/v3/) – Full API and class reference for plugin and module developers.
- [Demo site](https://demo.craftcms.com/) – Quickly launch a personalized demo of a Craft site.
- [Craft Slack](https://craftcms.com/community#slack) – Join one of the most friendly and helpful Slack groups around.
- [Craft Commerce](https://craftcommerce.com/) – First-party e-commerce platform for Craft.

#### Community Resources
- [CraftQuest](https://craftquest.io/) – Unlimited access to Craft training (and more) from Mijingo.
- [Envato Tuts+](https://webdesign.tutsplus.com/categories/craft-cms/courses) – Video courses.
- [nystudio107 Blog](https://nystudio107.com/blog) – Articles about Craft and modern web development.
- [Craft Link List](http://craftlinklist.com/) – Bimonthly newsletter about the Craft ecosystem.
- [Craft CMS Stack Exchange](http://craftcms.stackexchange.com/) – Community-run Q&A for Craft developers.
