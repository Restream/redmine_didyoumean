Redmine::Plugin.register :redmine_didyoumean do
  name 'Redmine Did-You-Mean Plugin'
  author 'Alessandro Bahgat and Mattia Tommasone'
  description 'This plugin searches for duplicate issues before adding a new issue.'
  version '1.2.4'
  url 'http://www.github.com/abahgat/redmine_didyoumean'
  author_url 'http://abahgat.com/'

  default_settings = {
    'show_only_open'    => '1',
    'project_filter'    => '1',
    'min_word_length'   => '2',
    'limit'             => '5',
    'start_search_when' => '0'
  }

  settings(default: default_settings, partial: 'settings/didyoumean_settings')
end

require 'redmine_didyoumean'
