resource "azurerm_monitor_scheduled_query_rules_alert_v2" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  severity            = var.severity
  enabled             = true

  evaluation_frequency = format("PT%dM", var.frequency_in_minutes)
  window_duration      = format("PT%dM", var.time_window_in_minutes)

  scopes = [
    var.log_analytics_workspace_id
  ]

  criteria {
    query                   = var.query
    time_aggregation_method = "Count"
    operator                = "GreaterThan"
    threshold               = 0

    failing_periods {
      minimum_failing_periods_to_trigger_alert = 1
      number_of_evaluation_periods             = 1
    }
  }

  action {
    action_groups = [var.action_group_id]
  }
}