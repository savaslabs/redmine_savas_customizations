module RedmineSavasCustomizations
  module Hooks
    class ControllerIssueHook < Redmine::Hook::ViewListener

      def object_custom_field_value(object, field_name)
        object.custom_field_values.each do |field|
          if field.custom_field.name == field_name
            return field.value.to_f
          end
        end
        return 0
      end

      def object_custom_field_set_value(object, field_name, value)
        object.custom_field_values.each do |field|
          if field.custom_field.name == field_name
            field.value = value.to_f
          end
        end
      end

      def controller_issues_new_before_save(context={})
        issue = context[:issue]
        return unless issue.estimated_hours
        issue.init_journal(User.current)
        object_custom_field_set_value(issue, "Remaining time", issue.estimated_hours)
      end

      def populate_remaining_time_field(context={})
        issue = context[:issue]
        return unless issue.estimated_hours

        time_entries = TimeEntry.where(:issue_id => issue.id)
        if time_entries
          @hours = time_entries.sum(:hours).to_f || 0
          new_remaining_hours = issue.estimated_hours - @hours
        else
          new_remaining_hours = issue.estimated_hours
        end

        # If existing remaining time equals new remaining time, then return.
        current_remaining_hours = object_custom_field_value(issue, "Remaining time")
        return unless (current_remaining_hours - new_remaining_hours) != 0

        # Write the new value.
        issue.init_journal(User.current)
        object_custom_field_set_value(issue, "Remaining time", new_remaining_hours)
      end

      def controller_issues_bulk_edit_before_save(context={})
        populate_remaining_time_field(context)
      end

      def controller_issues_edit_before_save(context={})
        populate_remaining_time_field(context)
      end

    end
  end
end
