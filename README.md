# z2jh-dev

Set of scripts to configure a jupytherhub in minikube with some customizations.

## How to use

Just run the following :
```sh
./init.sh
```

And finally deploy this helm charts :

```sh
helm upgrade --cleanup-on-fail --install hub jupyterhub/jupyterhub --version=2.0.0 --values config.yaml --timeout 200s
```

or in a custom namespace
```
helm upgrade --cleanup-on-fail --namespace your-namespace --create-namespace --install hub jupyterhub/jupyterhub --version=2.0.0 --values config.yaml --timeout 200s
```

## Notes

- In WSL, if images are built using docker, minikube might not be able to find them, reason why they are currently built using minikube
