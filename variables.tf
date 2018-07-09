# The title for the Datadog Time Board
variable "create" {
  default = true
}

# The title for the Datadog Time Board
variable "title" {}

# The description for the Datadog Time Board
variable "description" {}

# Is the board read_only, defaults to false
variable "read_only" {
  default = false
}

# The graphs, inputted from our graph module
variable "graph" {
  default = []
}

# a list of template_variable blocks
variable "template_variable" {
  default = []
}
