curl -X PUT http://19.30.100.11:8200/v1/sys/init --data '{"secret_shares":1, "secret_threshold":1}'

# {"keys":["afea2665d2b668aea95aea81881b9c4ac9a7b81693052776fed5ba9c2b1e338a"],"keys_base64":["r+omZdK2aK6pWuqBiBucSsmnuBaTBSd2/tW6nCseM4o="],"root_token":"hvs.4VSLV5K3wjGs1JTj1P5OKoO6"}

curl -X PUT http://19.30.100.11:8200/v1/sys/unseal --data '{"key":"afea2665d2b668aea95aea81881b9c4ac9a7b81693052776fed5ba9c2b1e338a"}'