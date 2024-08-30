# terraform-module-servicebus-queue

A Terraform module for creating Azure Service Bus queue
Refer to the following link for a detailed explanation of the Azure Service Bus queue.

[Azure Service Bus Queue](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-queues-topics-subscriptions)

## Usage

The following example shows how to use the module to create an Azure Service Bus queue. 

```terraform
module "servicebus-queue" {
  source                = "git@github.com:hmcts/terraform-module-servicebus-queue?ref=4.x"
  name                  = "your-queue"
  namespace_name        = module.servicebus-namespace.name
  resource_group_name   = azurerm_resource_group.rg.name
}
```

## Variables

### Configuration

The following parameters are required by this module

- `name` the name of the ServiceBus namespace.
- `resource_group_name` the name of the resource group in which to create the ServiceBus namespace.
- `namespace_name` the name of the service bus namespace in which the queue must be created.

### Output

The following variables are provided by the module for use in other modules

- `name` the name of the service bus queue.
- `primary_send_and_listen_connection_string` the Primary Connection String for the ServiceBus Queue send authorization Rule.
- `secondary_send_and_listen_connection_string` the Secondary Connection String for the ServiceBus Queue send authorization Rule.
- `primary_send_and_listen_shared_access_key` the Primary Key for the ServiceBus Queue send authorization Rule.
- `secondary_send_and_listen_shared_access_key` the Secondary Key for the ServiceBus Queue send authorization Rule.
- `primary_listen_connection_string` the Primary Connection String for the ServiceBus Queue listen authorization Rule.
- `secondary_listen_connection_string` the Secondary Connection String for the ServiceBus Queue listen authorization Rule.
- `primary_listen_shared_access_key` the Primary Key for the ServiceBus Queue listen authorization Rule.
- `secondary_listen_shared_access_key` the Secondary Key for the ServiceBus Queue listen authorization Rule.
