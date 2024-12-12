# Compatibility Check installation on Azure
To install please fill out `terraform.tfvars` file.

After <br>
```
terraform apply
```

Set your kubernetes config to your environment (if needed)
```
az aks get-credentials --resource-group lingua-community --name aks --admin
```

Set your `Caddy` file in `k8s/caddy.yaml`

K8S installation Steps:
1. Install `caddy`
    ```
    kubectl apply -f k8s/caddy.yaml
   
   # When update Caddyfile restart pod
   kubectl rollout restart deployment caddy -n caddy
   
   # Example
   apiVersion: v1
   kind: ConfigMap
   metadata:
   name: caddy-config
   namespace: caddy
   data:
   Caddyfile: |
      {
         email azamatjon@gmail.com
      }
   
       api.stg.broadfast.live {
         reverse_proxy http://api-service.api.svc.cluster.local:80
       }
       
       ws.stg.broadfast.live {
         reverse_proxy http://ws-service.ws.svc.cluster.local:80
       }
   
       stg.broadfast.live {
         reverse_proxy http://web-service.web.svc.cluster.local:80
       }
    ```
2. Set your config to GitHub action's secrets:
```
KUBECONFIG          terraform output kube_config

ACR_LOGIN_SERVER    terraform output acr_login_server
ACR_USERNAME        terraform output acr_username
ACR_PASSWORD        terraform output acr_password

AZURE_CLIENT_ID     terraform output azure_client_id
AZURE_CLIENT_SECRET terraform output azure_client_secret
AZURE_TENANT_ID     terraform output azure_tenant_id
```
3. Install knative:
```

```


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
# Kubernetes cheatsheet





terraform output acr_username
terraform output acr_password


Get cube admin config:
# 1
terraform output kube_config > kubeconfig.yaml
# 2
az aks get-credentials --resource-group main --name aks --admin
cp ~/.kube/config admin-kubeconfig.yaml


# install certs
brew install helm
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set installCRDs=true
kubectl get crds | grep cert-manager


kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.1/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.1/serving-core.yaml


kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.15.1/kourier.yaml



kubectl get nodes -o wide


export TF_LOG=DEBUG


kubectl apply -f k8s/caddy.yaml
kubectl create namespace web



kubectl get pods -n <>
kubectl logs -f <>
kubectl describe pod <>
kubectl delete deployments --all -n <>

kubectl delete pod caddy-7795d7489f-m44vm -n caddy
kubectl top pods -n web
kubectl top nodes -n web

kubectl get svc --all-namespaces


kubectl get svc        
kubectl describe svc <>
kubectl delete services --all -n <>


kubectl delete all --all -n <>

kubectl get pvc -n postgres


# When update Caddyfile restart pod
kubectl rollout restart deployment caddy -n caddy




https://shantanudeyanik.medium.com/implementing-knative-deployment-and-routing-for-public-exposure-aa840303d089





# Install queue microservice
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.1/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.15.1/serving-core.yaml

kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.15.1/kourier.yaml

kubectl apply -f k8s/knative-config.yaml

kubectl get ksvc -n response-analyzer

kubectl run curl-pod --image=curlimages/curl --restart=Never --rm -it -- curl http://example-service-one.kn-test.svc.cluster.local



# test in kubernetes
kubectl run test-pod --image=busybox --restart=Never --rm -it -- /bin/sh
kubectl logs -l app=rabbitmq -n rabbitmq

kubectl logs -l app=api -n api

kubectl describe pod -l app=rabbitmq -n rabbitmq

kubectl get secret azure-storage-secret -n cdn -o jsonpath="{.data.azurestorageaccountkey}" | base64 --decode
