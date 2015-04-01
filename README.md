# Redmine Did-You-Mean Plugin

[![Build Status](https://travis-ci.org/Undev/redmine_didyoumean.png)](https://travis-ci.org/Undev/redmine_didyoumean)
[![Code Climate](https://codeclimate.com/github/Undev/redmine_didyoumean.png)](https://codeclimate.com/github/Undev/redmine_didyoumean)

This plugin searches for possible duplicates when users are about to create a new issue.

The initial authors are [Alessandro Bahgat](http://blog.abahgat.com/) and [Mattia Tommasone](http://www.raibaz.com/).

## Installation

*These installation instructions are based on Redmine 2.6.0. For instructions for previous versions, see [Redmine wiki](http://www.redmine.org/projects/redmine/wiki/Plugins).*

1. To install the plugin
    * Download the .ZIP archive, extract files and copy the plugin directory into #{REDMINE_ROOT}/plugins.
    
    Or

    * Change you current directory to your Redmine root directory:  

            cd {REDMINE_ROOT}
            
      Copy the plugin from GitHub using the following commands:
      
            git clone https://github.com/Undev/redmine_didyoumean.git plugins/redmine_didyoumean
            
2. Restart Redmine.

Now you should be able to see the plugin in **Administration > Plugins**.

## Usage

To configure the plugin settings, go to **Administration > Plugins** and click **Configure**.  
![plugin settings](didyoumean_1.PNG)

The plugin shows the possible duplicate issues under the **Subject field**:
![similar issues](didyoumean_2.PNG)

## License

This plugin is licensed under the GNU GPL v2. See COPYRIGHT.txt and GPL.txt for details.
