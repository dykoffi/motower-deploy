namespace=motower-app

## Desintaller keycloak
kubectl delete -f keycloak.yml

## Desinstaller la chart postgres
helm uninstall postgres --namespace $namespace || true

## Desinstaller la chart keycloak
helm uninstall keycloak --namespace $namespace || true

## Desinstaller la chart postgres de keycloak
helm uninstall keycloak-postgres --namespace $namespace || true

## Delete PVCs
kubectl delete  pvc data-keycloak-postgres-postgresql-0 --namespace $namespace
kubectl delete  pvc data-postgres-postgresql-0 --namespace $namespace