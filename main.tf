resource "datadog_timeboard" "this" {
  count       = "${var.create == true ?  1 : 0 }"
  title       = "${var.title}"
  description = "${var.description}"
  read_only   = "${var.read_only}"

  graph = [
    "${var.graph}",
  ]

  template_variable = []
}
