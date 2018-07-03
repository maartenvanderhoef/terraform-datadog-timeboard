variable "title" {}

variable "viz" {}

variable "request" {
  default = []
}

variable "events" {
  default = []
}

variable "autoscale" {
  default = false
}

variable "precision" {
  default = ""
}

variable "custom_unit" {
  default = ""
}

variable "text_align" {
  default = ""
}

variable "group" {
  default = []
}

variable "include_no_metric_hosts" {
  default = ""
}

variable "include_ungrouped_hosts" {
  default = ""
}

variable "scope" {
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

    events = ["${var.events}"]

    autoscale = "${var.autoscale}"

    precision = "${var.precision}"

    custom_unit = "${var.custom_unit}"

    text_align = "${var.text_align}"

    scope = ["${var.scope}"]
  }
}

output "graph" {
  value = "${local.graph}"
}
