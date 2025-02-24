provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  validate = true
}

variable "datadog_api_key" {}
variable "datadog_app_key" {}

resource "datadog_monitor" "cpu_high" {
  name    = "High CPU Usage Alert"
  type    = "metric alert"
  query   = "avg(last_5m):avg:system.cpu.user{*} > 80"
  message = "CPU usage is above 80%!"
  tags    = ["environment:test"]
  thresholds = {
    critical = 80
  }
}