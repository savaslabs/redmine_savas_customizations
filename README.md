# Redmine Savas Labs Customizations

This is a plugin for managing customizations to our Redmine instance.

## Features

### Harvest Timer Button

An issue views, a Harvest timer button is available. Harvest will try to pre-populate the relevant project and task based on past time logged to a particular issue.

### Issue template

A pre-loaded issue template is set on the Description field for our issue trackers. For now, the template is hardcoded in the `_form.html.erb` file.

When updating Redmine to a new version (`3.3` to `3.4` or `3.x` to `4.x`) be sure to review the diff of this template with the upstream template file.

### RUM tracking

Adds Pingdom's RUM tracking for performance alerts.
