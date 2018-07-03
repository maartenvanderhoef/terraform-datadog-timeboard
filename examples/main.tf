provider "datadog" {
  api_key = ""
  app_key = ""
}

module "datadog_graph_redis" {
  source  = "maartenvanderhoef/timeboard/datadog//modules/graph"
  version = "0.0.2"

  title  = "Top System CPU by Docker container"
  viz    = "toplist"

  request = [
    {
      q       = "avg:redis.mem.used{$host} - avg:redis.mem.lua{$host}, avg:redis.mem.lua{$host}"
      stacked = true
    },
    {
      q = "avg:redis.mem.rss{$host}"

      style {
        palette = "warm"
      }
    },
  ]
}

module "datadog_graph_system_cpu" {
  source  = "maartenvanderhoef/timeboard/datadog//modules/graph"
  version = "0.0.2"

  title  = "Top System CPU by Docker container"
  viz    = "toplist"

  request = [{
    q = "top(avg:docker.cpu.system{*} by {container_name}, 10, 'mean', 'desc')"
  }]
}

module "datadog_timeboard" {
  source  = "maartenvanderhoef/timeboard/datadog"
  version = "0.0.2"
  title       = "Redis Timeboard (created via Terraform)"
  description = "created using the Datadog provider in Terraform"
  read_only   = true

  graph = [
    "${module.datadog_graph_redis.graph}",
    "${module.datadog_graph_system_cpu.graph}",
  ]

  template_variable = [{
    name   = "*"
    prefix = "host"
  }]
}
