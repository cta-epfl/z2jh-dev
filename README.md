# z2jh-dev

Set of scripts to configure a jupytherhub in minikube with some customizations.

## How to use

Just run the following :
```sh
./init.sh
```

And finally deploy this helm charts :

```sh
helm upgrade --set-file hub.extraFiles.errorTemplate.stringData=./templates/error.html --cleanup-on-fail --install hub jupyterhub/jupyterhub --version=2.0.0 --values config.yaml --timeout 200s
```

or in a custom namespace
```
helm upgrade --cleanup-on-fail --namespace your-namespace --create-namespace --install hub jupyterhub/jupyterhub --version=2.0.0 --values config.yaml --timeout 200s
```

## Oauthentication

To use, please create an oauth app using a provider and configure the `client id` and `client secret` in the helm charts. 

### Github
- https://docs.github.com/fr/apps/oauth-apps/building-oauth-apps/creating-an-oauth-app

### Gitlab
- https://docs.gitlab.com/ee/integration/oauth_provider.html

:warning: When choosing the scope of the application, it requires the `api` scope to work !

## Notes

- In WSL, if images are built using docker, minikube might not be able to find them, reason why they are currently built using minikube
- For production, requires using secrets for providing oauth `client_secret`
