# Full configuration options can be found at https://www.vaultproject.io/docs/configuration

ui = true

#mlock = true
disable_mlock = true

#storage "file" {
#  path = "/opt/vault/data"
#}

# Use Consul 
storage "consul" {
 address = "consul_server_ip:8500"
 path    = "vault"
 max_parallel = 1024
}

# Used with Consul + Nomad Integration
#service_registration "consul" {
#  address      = "192.168.35.9:8500"
#}
#storage "raft" {
#  path = "/vault/raft/data"
# node_id = "raft_node_1"
#}

# HTTP listener
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
  #tuning
  #http_idle_timeout = "10s"
  #proxy_protocol_behavior ="use_always"
}

# HTTPS listener
#listener "tcp" {
#  address       = "0.0.0.0:8200"
#  tls_disable = 1
##  tls_cert_file = "/opt/vault/tls/tls.crt"
#  tls_key_file  = "/opt/vault/tls/tls.key"
#}

api_addr = "http://192.168.35.4:8200"
cluster_addr = "http://192.168.35.4:8201"

# Enterprise license_path
# This will be required for enterprise as of v1.8
license_path = "/etc/vault.d/vault.hclic"


#default_max_request_duration = "30s"
# Example AWS KMS auto unseal
#seal "awskms" {
#  region = "us-east-1"
#  kms_key_id = "REPLACE-ME"
#}

# Example HSM auto unseal
#seal "pkcs11" {
#  lib            = "/usr/vault/lib/libCryptoki2_64.so"
#  slot           = "0"
#  pin            = "AAAA-BBBB-CCCC-DDDD"
#  key_label      = "vault-hsm-key"
#  hmac_key_label = "vault-hsm-hmac-key"
#}

#entropy "seal" {
  #mode = "augmentation"
#}

#seal "pkcs11" {
#  lib = "/usr/safenet/lunaclient/lib/libCryptoki2_64.so"
#  slot = "0"
#  pin = "1q2w3e4r!"
#  key_label = "hsm_demo"
#  hmac_key_label = "hsm_hmac_demo"
#  generate_key = "true"
#}

#log_level="debug"
#log_format="standard"
