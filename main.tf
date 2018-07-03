variable "title" {}

variable "viz" {}

variable "request" {
  default = []
}

variable "viz_map" {
  type = "map"

  default = {
    change       = "change"
    distribution = "distribution"
    heatmap      = "heatmap"
    hostmap      = "hostmap"
    query_value  = "query_value"
    timeseries   = "timeseries"
    toplist      = "toplist"
  }
}

locals {
  graph = {
    title = "${var.title}"
    viz   = "${lookup(var.viz_map,var.viz)}"

    request = ["${var.request}"]
  }
}

output "graph" {
  value = "${local.graph}"
}
