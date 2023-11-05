## Definir les variables
namespace=motower-app
minio_namespace=motower-minio

## Appliquer les ressources quotas
kubectl apply -f rq.yml

## Ajouter le repo de charts bitnami
helm repo add bitnami https://charts.bitnami.com/bitnami 

## Installer la chart postgres
helm upgrade --install postgres bitnami/postgresql --namespace $namespace --create-namespace --version "12.11.1" -f $(pwd)/postgres_values.yml

## Installer la chart postgres for keycloak
helm upgrade --install keycloak-postgres bitnami/postgresql --namespace $namespace --create-namespace --version "12.11.1" -f $(pwd)/keycloak_postgres_values.yml

# ## Installer keycloak
kubectl apply -f keycloak.yml
keycloak_pod=$(kubectl get po --namespace $namespace --selector=app=keycloak --template='{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')

## Attendre que le pod de keycloak soit pret
kubectl wait --timeout=-1s --for=condition=Ready pod/$keycloak_pod -n $namespace

## Copier le dossier keycloakify-starter dans le conteneur de keycloak pour l'application du theme oci
tar cf - keycloakify-starter | kubectl exec -i -n $namespace $keycloak_pod -- tar xf - -C /opt/bitnami/keycloak/themes/