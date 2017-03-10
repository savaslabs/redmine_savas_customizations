require_dependency 'redmine_savas_customizations/hooks'

Redmine::Plugin.register :redmine_savas_customizations do
  name 'Redmine Savas Customizations'
  author 'Kosta Harlan'
  description 'Savas Labs customizations'
  version '0.2.0'
  url 'https://github.com/savaslabs/redmine-savas-customizations'
  author_url 'http://savaslabs.com'
  settings :default => {
             :issue_template => '',
           },
  :partial => 'settings/savaslabs'
end
