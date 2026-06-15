
################################################################################

variable "test" {
  type = string
  default = ""
}

variable "test_op" {
  description = "test var"
  type = object({
    name = string
    age = number
    isAlive = bool
  })
  default = {
    name = "nasir"
    age = 10
    isAlive = false
  }
}

