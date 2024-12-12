



    stg.lingua.community {
      reverse_proxy http://web-service.web.svc.cluster.local:80
    }

    cdn.stg.lingua.community {
      reverse_proxy http://cdn-service.cdn.svc.cluster.local:80
    }

    api.stg.lingua.community {
      reverse_proxy http://api-service.api.svc.cluster.local:80
    }

    ws.stg.lingua.community {
      reverse_proxy http://ws-service.ws.svc.cluster.local:80
    }

    ws-demo.stg.lingua.community {
      reverse_proxy http://ws-demo-service.ws-demo.svc.cluster.local:80
    }

#    api.stg.broadfast.live {
#      reverse_proxy http://api-service.api.svc.cluster.local:80
#    }
#
#    ws.stg.broadfast.live {
#      reverse_proxy http://ws-service.ws.svc.cluster.local:80
#    }
#
#    stg.broadfast.live {
#      reverse_proxy http://web-service.web.svc.cluster.local:80
#    }
