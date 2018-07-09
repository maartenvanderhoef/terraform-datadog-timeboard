provider "datadog" {
  api_key = "${var.datadog_api_key}"
  app_key = "${var.datadog_app_key}"
}

module "datadog_graph_system_load" {
  source  = "maartenvanderhoef/timeboard/datadog//modules/graph"
  version = "0.0.3"

  title = "System Load"
  viz   = "timeseries"

  request = [
    {
      q    = "avg:system.load.1{*} by {host}"
      type = "area"

      style {
        palette = "dog_classic"
        type    = "solid"
        width   = "normal"
      }

      aggregator = "avg"
    },
  ]
}

module "datadog_graph_cpu_idle" {
  source  = "maartenvanderhoef/timeboard/datadog//modules/graph"
  version = "0.0.3"

  title = "CPU Idle per Host"
  viz   = "timeseries"

  request = [
    {
      q    = "avg:system.cpu.idle{*} by {host}"
      type = "area"

      style {
        palette = "dog_classic"
        type    = "solid"
        width   = "normal"
      }

      aggregator = "avg"
    },
  ]
}

module "datadog_timeboard" {
  source      = "maartenvanderhoef/timeboard/datadog"
  version     = "0.0.3"
  title       = "System Graphs"
  description = "System Graphs description"
  read_only   = true

  graph = [
    "${module.datadog_graph_system_load.graph}",
    "${module.datadog_graph_cpu_idle.graph}",
  ]
}
