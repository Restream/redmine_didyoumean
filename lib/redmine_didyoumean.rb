ActionDispatch::Callbacks.to_prepare do

  # Requiring plugin's controller
  require_dependency 'search_issues_controller'

  # Requiring hooks
  require_dependency 'redmine_didyoumean/hooks/didyoumean_hooks'
end

