## Create namespace motower-ihm
```bash
kubectl create ns motower-ihm
```

## Create resource quota namespace
```bash
kubectl apply k8s/rq.yml
```

## Install Stack chart helm (Postgres and keycloak)
```bash
cd stack
sh run.sh
```

## Build backend image and push it on docker registry
## Create kubernetes imagePullsecret for pulling image from private registry
```bash
kubectl create secret docker-registry dockerSecret -n motower-ihm --docker-server= --docker-username= --docker-password=
```

## Run backend deployement
```bash
cd k8s
kubectl apply -f back.yml
```

## Build frontent image using previous env vars results and push it on docker registry

## run frontent deployement
```bash
cd k8s
kubectl apply -f front.yml
```
## Configure keycloak
  1. Select the realm gps-realm
  2. In User Federation > AD OCI : Update ldap password and test connection.
    If the connection doesn't work disable ldap config
  3. In the Settings of nest-app client: Change all host value by the frontend host
  4. Create one user with credentials
  5. Assign roles (nest-app client roles) to this user

## Test Application
  1. Go to the frontend url
  2. Login with the user you have previously created
  3. Try to do something
