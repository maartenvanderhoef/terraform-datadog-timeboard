resource "datadog_timeboard" "this" {
  title       = "${var.title}"
  description = "${var.description}"
  read_only   = "${var.read_only}"

  graph = [
    "${var.graph}",
  ]

  template_variable = []
}
