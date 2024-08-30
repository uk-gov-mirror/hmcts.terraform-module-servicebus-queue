locals {
  send_auth_rule_name   = "SendSharedAccessKey"
  listen_auth_rule_name = "ListenSharedAccessKey"
}

data "azurerm_servicebus_namespace" "this" {
  name                = var.namespace_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_servicebus_queue" "servicebus_queue" {
  name         = var.name
  namespace_id = data.azurerm_servicebus_namespace.this.id

  lock_duration                           = var.lock_duration
  max_delivery_count                      = var.max_delivery_count
  requires_duplicate_detection            = var.requires_duplicate_detection
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  requires_session                        = var.requires_session
  max_message_size_in_kilobytes           = var.max_message_size_in_kilobytes

  max_size_in_megabytes                = 1024
  default_message_ttl                  = "P10675199DT2H48M5.4775807S"
  dead_lettering_on_message_expiration = true
  auto_delete_on_idle                  = "P10675199DT2H48M5.4775807S"
  partitioning_enabled                 = false
  express_enabled                      = false
}

resource "azurerm_servicebus_queue_authorization_rule" "send_auth_rule" {
  name     = local.send_auth_rule_name
  queue_id = azurerm_servicebus_queue.servicebus_queue.id

  send = true
}

resource "azurerm_servicebus_queue_authorization_rule" "listen_auth_rule" {
  name     = local.listen_auth_rule_name
  queue_id = azurerm_servicebus_queue.servicebus_queue.id

  listen = true
}
