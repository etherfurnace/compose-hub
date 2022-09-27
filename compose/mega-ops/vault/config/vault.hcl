backend "mysql" {
    address = "19.30.100.11:3306"
    username = "root"
    password = "password"
}

listener "tcp" {
    address = "0.0.0.0:8200"
    tls_disable = 1
}
ui = true
disable_mlock = true