require File.dirname(__FILE__) + '/../test_helper'

class SearchIssuesControllerTest < ActionController::TestCase
  fixtures :projects,
    :users,
    :roles,
    :members,
    :member_roles,
    :issues,
    :issue_statuses,
    :issue_relations,
    :versions,
    :trackers,
    :projects_trackers,
    :issue_categories,
    :enabled_modules,
    :enumerations

  def setup
    @request.session[:user_id] = 2
  end

  def test_find_exactly_one_issue
    get :index, query: 'Cannot print recipes', format: 'json'
    assert_response :success
    assert_total 1
    assert_has_subject 'Cannot print recipes'
  end

  def test_find_all_issues_by_partial_subject
    get :index, query: 'recipe', format: 'json'
    assert_response :success
    assert_total 2
    assert_subjects ['Cannot print recipes', 'Error 281 when updating a recipe']
  end

  def test_does_not_return_closed_issues
    get :index, query: 'Closed issue', format: 'json'
    assert_response :success
    assert_total 0
    assert_subjects []
  end

  def test_does_not_return_forbidden_issues
    get :index, query: 'Issue of a private subproject', format: 'json'
    assert_response :success
    assert_total 0
    assert_subjects []
  end

  private

  def assert_total(total, message = nil)
    assert_equal total, json_response['total'], message
  end

  def assert_subjects(subjects, message = nil)
    returned_subjects = json_response['issues'].map { |issue| issue['subject'] }
    assert_equal subjects.sort, returned_subjects.sort, message
  end

  def assert_has_subject(subject, message = nil)
    issue = json_response['issues'].detect { |issue| issue['subject'] == subject }
    assert issue, message || "Did not fount issue with subject: #{ subject }"
  end

  def json_response
    ActiveSupport::JSON.decode response.body
  end
end
