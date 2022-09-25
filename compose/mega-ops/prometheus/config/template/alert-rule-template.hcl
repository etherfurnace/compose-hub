
consul {
  address = "19.30.100.11:8500"
  retry {
    enabled = true
    attempts = 0
    backoff = "250ms"
    max_backoff = "1m"
  }
}

template {
  source = "/opt/bitnami/prometheus/conf/template/alert-rule.tpl"
  destination = "/opt/bitnami/prometheus/conf/alert-rule.yml"
  command="wget -O- --post-data='' --header='Content-Type:application/json' 'http://19.30.100.11:9090/-/reload'"
}