function observeIssueSubjectField(project_id, event_type) {
  $('issue_subject').observe(event_type, function(event){
    var url = dym.search_url;
    new Ajax.Request(url, {
      parameters: {
        project_id: project_id,
        query: Event.element(event).value
      },
      onSuccess: function(transport) {
        var data = transport.responseJSON;
        updateSimilarIssuesBlock(data);
      },
      evalJSON: true
    });
  });
}

function updateSimilarIssuesBlock(data) {
  if(!data.total) {
    $('similar_issues').hide();
    return;
  }

  var similar_issues_data = "";

  var items = data.issues;
  for (var i = items.length - 1; i >= 0; i--) {
    var item_html = displayItem(items[i]);
    similar_issues_data = item_html + similar_issues_data;
  }

  if (data.total > data.issues.length) {
    var more = data.total - data.issues.length;
    similar_issues_data += '<li>+' + more + ' ' + dym.label_more + '</li>';
  }

  $('issues_count').innerHTML = data.total;
  $('similar_issues_list').innerHTML = similar_issues_data;

  if (! $('similar_issues').visible()) {
    $('similar_issues').show();
  }
}

function displayItem(item) {

  var issue_url = sanitize(dym.issue_url + '/' + item.id);
  var tracker_name = sanitize(item.tracker.name);
  var item_id = sanitize('#' + item.id);
  var item_subject = sanitize(item.subject);
  var item_status = sanitize(item.status.name);
  var project_name = sanitize(item.project.name);

  var item_html = '<li><a href="' + issue_url + '">'
    + tracker_name
    + ' ' + item_id
    + ' &ndash; '
    + item_subject
    + '</a> ('
    + item_status
    + ' '
    + dym.label_in
    + ' ' + project_name
    + ')</li>';

  return item_html;
}

function sanitize(value) {

  var html_safe = value.replace(/[<]+/g, '&lt;')
                      .replace(/[>]+/g, '&gt;')
                      .replace(/["]+/g, '&quot;')
                      .replace(/[']+/g, '&#039;');
  return html_safe;
}
