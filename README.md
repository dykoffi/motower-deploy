## Create namespace motower-app 
- On rke2
```bash
kubectl create ns motower-app
```
- On Robin
```bash
robin namespace add motower-app --username motower
```

## Install Stack apps (Postgres and keycloak)
```bash
cd stack
sh run.sh
```

## Build backend image and push it on docker registry
## Create kubernetes imagePullsecret for pulling image from private registry
```bash
kubectl create secret docker-registry dockersecret -n motower-app --docker-server= --docker-username= --docker-password=
```

## Run backend deployement
```bash
cd app
kubectl apply -f back.yml
```

## Build frontent image using previous env vars results and push it on docker registry

## run frontent deployement
```bash
cd app
kubectl apply -f front.yml
```
## Configure keycloak
  1. Create new realm gps-realm by importing a realm.json file
  2. Select the realm gps-realm
  3. In User Federation > AD OCI : Update ldap password and test connection.
    If the connection doesn't work disable ldap config
  4. In the Settings of nest-app client: Change all host value by the frontend host
  5. Create one user with credentials
  6. Assign roles (nest-app client roles) to this user

## Test Application
  1. Go to the frontend url
  2. Login with the user you have previously created
  3. Try to do something

## Delete All
```bash
kubectl delete all --all -n motower-app
```