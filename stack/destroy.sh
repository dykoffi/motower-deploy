namespace=motower-ihm

## Desinstaller la chart postgres
helm uninstall postgres --namespace $namespace || true

## Desinstaller la chart keycloak
helm uninstall keycloak --namespace $namespace || true

## Delete PVCs
kubectl delete  pvc data-keycloak-postgresql-0 --namespace $namespace
kubectl delete  pvc data-postgres-postgresql-0 --namespace $namespace