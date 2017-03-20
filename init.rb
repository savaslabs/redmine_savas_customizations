require_dependency 'redmine_savas_customizations/hooks/pingdom.rb'
require_dependency 'redmine_savas_customizations/hooks/controller_issue_hook.rb'

Redmine::Plugin.register :redmine_savas_customizations do
  name 'Redmine Savas Customizations'
  author 'Kosta Harlan'
  description 'Savas Labs customizations'
  version '0.3.0'
  url 'https://github.com/savaslabs/redmine-savas-customizations'
  author_url 'http://savaslabs.com'
  settings :default => {
             :issue_template => '',
           },
  :partial => 'settings/savaslabs'
end
