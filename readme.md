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
1. Access your control panel at `/admin` and login using the credentials you created during installation. Browse to Settings -> Plugins, and install each of the plugins listed.

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

<a href="https://craftcms.com/" rel="noopener" target="_blank"><img width="247" height="60" src="https://craftcms.com/craftcms.svg" alt="Craft CMS"></a>

<br>

[Craft](https://craftcms.com/) is a flexible, user-friendly CMS for creating custom digital experiences on the web and beyond.

In technical terms, it’s a self-hosted PHP 8 application backed by a MySQL or Postgres database. Read more in the [official documentation](https://craftcms.com/docs).

__Psst!__ Looking for the Craft source code? Need to file a bug report or feature request? Check out [`craftcms/cms`](https://github.com/craftcms/cms).

---

:postal_horn: **If you just heard about Craft:** Take a feature tour on [our website](https://craftcms.com/features)—then spin up a [demo project](https://craftcms.com/demo) to try them out for yourself.

:construction_worker_woman: **If you are eager to start building:** You’re in exactly the right place!

## Getting Started

This repository is a bare-bones [Composer](https://getcomposer.org/) “project,” intended for use with the `composer create-project` command. It contains only the folders and files absolutely required to run Craft.

> **Note**
> Our [tutorial](https://craftcms.com/docs/getting-started-tutorial/) covers this setup process in greater depth. If you get stuck, give it a once-over; if things still aren’t clicking, help is never far away in [our community](https://craftcms.com/community) or via [official support](https://craftcms.com/support-services).
>
> You can also find these instructions (and some other helpful tips) in [the documentation](https://craftcms.com/docs/4.x/installation.html).

The best way to spin up your first project is with [DDEV](https://ddev.com/), a cross-platform, Docker-based PHP development environment.

1. [Install DDEV](https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/)
2. Choose a folder for your project and move into it:
    ```bash
    cd /path/to/web/projects
    mkdir my-project
    cd my-project
    ```
3. Configure a new DDEV [project](https://ddev.readthedocs.io/en/latest/users/quickstart/#craft-cms), and install Craft:
    ```bash
    ddev config --project-type=craftcms --docroot=web --create-docroot

    # Use this package as a starting point:
    ddev composer create -y --no-scripts craftcms/craft

    # Run the Craft CMS installer (use all defaults):
    ddev craft install
    ```
4. Run `ddev launch` to open the project in your browser.

Craft’s [control panel](https://craftcms.com/docs/4.x/control-panel.html) is located at `/admin`. The rest is up to you! Pick up where we left off in [the tutorial](https://craftcms.com/docs/getting-started-tutorial/configure/control-panel.html), or dive right in on modeling your own content:
- :card_file_box: [Elements](https://craftcms.com/docs/4.x/elements.html): Learn about Craft’s core content types, and how to customize them.
- :triangular_ruler: [Fields](https://craftcms.com/docs/4.x/fields.html): Create precisely the data structure and authoring experience you need.
- :pencil2: [Templating](https://craftcms.com/docs/4.x/dev/twig-primer.html): Start using your data in a totally custom front-end.

## Resources

Craft comes with a ton of official and community [resources](https://github.com/craftcms/cms#resources).
