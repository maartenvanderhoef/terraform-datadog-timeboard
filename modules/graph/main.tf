locals {
  graph = {
    title = "${var.title}"

    viz = "${lookup(var.viz_map,var.viz)}"

    request = ["${var.request}"]

    events = ["${var.events}"]

    autoscale = "${var.autoscale}"

    precision = "${var.precision}"

    custom_unit = "${var.custom_unit}"

    text_align = "${var.text_align}"

    scope = ["${var.scope}"]
  }
}
