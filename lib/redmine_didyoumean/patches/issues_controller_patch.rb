require 'issues_controller'

module RedmineDidyoumean::Patches::IssuesControllerPatch
  extend ActiveSupport::Concern

  included do
    before_filter :include_didyoumean_helper
  end

  def include_didyoumean_helper
    unless _helpers.included_modules.include? RedmineDidyoumeanHelper
      self.class.helper RedmineDidyoumeanHelper
    end
    true
  end
end

unless IssuesController.included_modules.include? RedmineDidyoumean::Patches::IssuesControllerPatch
  IssuesController.send :include, RedmineDidyoumean::Patches::IssuesControllerPatch
end
