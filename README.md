1. Create namespace motower-ihm
```bash
kubectl create ns motower
```
2. Install Stack chart helm (Postgres and keycloak)
```bash
cd stack
sh run.sh
```

3. Build backend image and push it on docker registry
4. Create kubernetes imagePullsecret for pulling image from private registry
```bash
kubectl create secret docker-registry <secretName> --docker-server= --docker-user= --docker-password=
```

5. Run backend deployement
```bash
cd k8s
kubectl apply -f back.yml
```

6. Get environment variables before building frontent
```bash
sh get_vars.sh
```

7. Build frontent image using previous env vars results and push it on docker registry
8. run frontent deployement
```bash
cd k8s
kubectl apply -f front.yml
```
9. Configure keycloak
  1. Select the realm gps-realm
  2. In User Federation > AD OCI : Update ldap password and test connection.
    If the connection doesn't work disable ldap config
  3. In the Settings of nest-app client: Change all host value by the frontend host
  4. Create one user with credentials
  5. Assign roles (nest-app client roles) to this user

10. Test Application
  1. Go to the frontend url
  2. Login with the user you have previously created
  3. Try to do something
