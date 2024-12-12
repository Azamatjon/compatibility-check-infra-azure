# Azure Subscription ID
subscription_id = "7951bf18-1fe0-46cb-bfad-4c9ce0b6109a"

# Azure Tenant ID
tenant_id = "0f70851e-ec4b-4015-938b-fc12bae83a9b"

# Azure Client ID (Application ID)
client_id = "9a117af5-9918-40a8-9e15-562326537d09"

# Azure Client Secret
client_secret = "W0a8Q~97aU4fLMBqJ5kJrgpW7hPsuAAfvEKGHaJz"

# Location of resources
location = "UK South"

domainEmail = "azafdddf@dsd.com"
domainNames = {
  web = {
    name = "ai.roomiecheck.com"
    localAddress = "web-service.web.svc.cluster.local:80"
  }
  api = {
    name = "api.ai.roomiecheck.com"
    localAddress = "api-service.api.svc.cluster.local:80"
  }
  ws = {
    name = "ws.ai.roomiecheck.com"
    localAddress = "ws-service.ws.svc.cluster.local:80"
  }
  cdn = {
    name = "cdn.ai.roomiecheck.com"
    localAddress = "cdn-service.cdn.svc.cluster.local:80"
  }
}

storage = {
  quota = 5
  account_name = "airoomiecheckstorage"
  share_name = "common"
}

postgres = {
  host = "postgres-service.postgres.svc.cluster.local"
  port = 5432
  user = "postgres"
  password = "fertfert123"
  db = "production"
  storageQuota = 3
}

rabbitmq = {
  host = "rabbitmq-service.rabbitmq.svc.cluster.local"
  port = 5672
  managementPort = 15672
  username = "rabbitmq"
  password = "fertfert123"
  storageQuota = 1
}

auth = {
  jwt = {
    privateKey = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEAtUOl3bhGF4wA3DExA/Oobf5IaP4Cf3J0D96DW7UtK0vpADP8\n0PhQTQ7aESBRP8tqWCjWKUp2MUZoLhX5r2zOcpWG87vnAxIEyTbM7gm8rl/kJuxK\n6V1oOFeXUfOc2PoeREkPgDUZWKvQqYraOxzR3bw3ne9wUXmH16m4eYk/d37+m2va\n/cbdMxXgqNfIxP/EtVYYQNYSe1uZvhsFw3rKv2yKx9iel+EozIMv4DaD0pLjDabp\nPE8OaNLlOdgIjCTfcUT6UVwZgBaLmhWNvn7BiW8dihlhdmSTfAld56E4KYWTaYL5\nRSifBAKHI95tP0gOpncEsvTgzfOd8krjq5igaQIDAQABAoIBAGg1TO0r3Hf7EB+G\n1EQOV31s29oode0pMppQ9TnK7f3fNUPdn3HP3/J9IFcKOkuvuSKXz4+LdGmdrZUZ\nIyN8LS/o0N3c39F/EWtQav5KcMPa8wKBhAunnJwPlzoRENIY8T+WtSei30B//oUK\nA65KQkj0xRCyL+NXOAZ/V0Pf6LHcQ9iP1Y9Dhj15KF88bH1Ugo/VcKpa3zQYfiEg\n8dyHb2iadUYZ09HGo3al4vVyvyYLApkj1cwadjo1UjkPcbhYE68DHN1FUlryIboi\ncFnh/vpR29gT9rK+CzXopKxnAwvfKBSBE0cq6W+2JIoS/ubz5pA4H70szH9osWj/\n28EuCwECgYEA3oXdRWjjtHol0/Aghy/GW1UN8Hrvgb2TeAVG5zYsBpA5srz8lUmy\nsbvy1WlFcLPoQhoJpirw46cjr5A52D42cbxk1o7Hs69s7FbmSmBvj9Itl4HUEp6h\n1Y3rWoIip+TdVMFm3WtaTTrhzTHHVe9p6ph4xQAaJTOo11mNQhElhIkCgYEA0IjE\nsFhHaq11e6d8c2jLXfjxXVYUDSoJC7eESGyCFhtHGzJH9JkhLFlwuioK3qWEjeKM\n1USAkNj+MaF68lUUpeB6VI5nGAkYXpU284rVWJCw4QvdyzhLFSVZ/DbaBAkKQBX6\nNIpsYoX3Uz5uPtmfapolvULA5uj443ZRR43lBOECgYEAoT/6J2kp0MfPD7TrrWsG\nX3rUHhbH5ol9CrUwOy47Wwo6dXaTxo7gSgF7qACgDFqijPwXT+3AIAgnSPrHoBb9\nFxBBNmXC+0e9M8qJGQ6m6V6SIT84ccG4Xmt4SF8TQ/0KEngP1ZYMmvh3Vl2jKHfU\nlealZYR8bcbwrBU90slgGZkCgYEAtijCp8h1mhorpfiIHchM3am4LXAj09wEStfk\nFd+zQtxRINCrSl75O2RltDlFhXfQcqCTpThRljX21iPY4hawErYkJfi+1aAcSYLO\nna+I7fR2jh9vfzWNYMtf75F6oEvFSHXqOjswsl+TzIOcigpP1y8QCGNnXk3kG84e\n8gJhLAECgYBO32nnQLSsns3x7HpOCHXksFqHY+zfCH+8NzzSKjYcuhrp8YBpn6Sk\nQllhOHIg3H8YZESBwd8/8KT1mut1S6b02EQvSz2F8ShpWLSsy35B0E0zqs4Ceet7\n0p4+qurMZ09IjX9Z0rlEBWds5638t1fgPnOYd2rpFG2iJKxHLc3ZVg==\n-----END RSA PRIVATE KEY-----"
    publicKey = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtUOl3bhGF4wA3DExA/Oo\nbf5IaP4Cf3J0D96DW7UtK0vpADP80PhQTQ7aESBRP8tqWCjWKUp2MUZoLhX5r2zO\ncpWG87vnAxIEyTbM7gm8rl/kJuxK6V1oOFeXUfOc2PoeREkPgDUZWKvQqYraOxzR\n3bw3ne9wUXmH16m4eYk/d37+m2va/cbdMxXgqNfIxP/EtVYYQNYSe1uZvhsFw3rK\nv2yKx9iel+EozIMv4DaD0pLjDabpPE8OaNLlOdgIjCTfcUT6UVwZgBaLmhWNvn7B\niW8dihlhdmSTfAld56E4KYWTaYL5RSifBAKHI95tP0gOpncEsvTgzfOd8krjq5ig\naQIDAQAB\n-----END PUBLIC KEY-----"
  }
}

web = {
  graphqlHttp = "https://api.ai.roomiecheck.com/graphql"
}

redis = {
  host = "redis-service.redis.svc.cluster.local"
  port = 6379
  password = "fertfert123"
  storageQuota = 1
}
