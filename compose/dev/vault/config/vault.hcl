backend "mysql" {
    address = "10.11.25.50:3306"
    username = "root"
    password = "password"
}

listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}
ui = true
disable_mlock = true