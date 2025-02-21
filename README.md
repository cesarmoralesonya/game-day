# game-day

## wiki

```bash
git submodule add https://github.com/cesarmoralesonya/game-day.wiki.git wiki
git submodule update --init --recursive
```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: storefront-blue
spec:
  replicas: 5
  selector:
    matchLabels:
      app: storefront-blue
  template:
    metadata:
      labels:
        app: storefront-blue
    spec:
      containers:
      - name: storefront-container
        image: IMAGE_URI
        ports:
        - containerPort: 5000
        resources:
          limits:
            memory: "200Mi"
            cpu: "400m"
        env:
          - name: PROXY_URL
            value: http://proxy.unicorn.rentals/
          - name: STOREFRONT_COLOR
            value: blue
```

files to replace IMAGE_URI:
storefront-deployment.yaml
storefront-deployment-blue.yaml
storefront-deployment-green.yaml
storefront-deployment-red.yaml

value for IMAGE_URI:
031933477616.dkr.ecr.us-east-1.amazonaws.com/unicorn-container-repo:latest

objective:
generate a bash command to replace the IMAGE_URI in the files mentioned above with the value provided.

```bash
sed -i 's|blue|pink|g' storefront-deployment-blue.yaml
```

probe

```bash
sed -i 's|IMAGE_URI|031933477616.dkr.ecr.us-east-1.amazonaws.com/unicorn-container-repo:latest|g' storefront-deployment-blue.yaml
```

## Hostnames

- hostname: ac296bc740f5c43248f1e21bc84ac2b2-828109708.us-east-1.elb.amazonaws.com
- hostname: a51c334c340a946658fcd633bf41660f-954114269.us-east-1.elb.amazonaws.com

## Kube commands

### Get all pods

```bash
kubectl get pods
```

### Get data from pod

```bash
kubectl describe pod <pod-name>
```

### Update services

Update/launch pods

```bash
kubectl apply -f /home/ec2-user/store_app/deployments/applications/
```

Update/launch network services!

```bash
kubectl apply -f /home/ec2-user/store_app/deployments/services/
```

### Delete services !CAUTION

Delete pods

```bash
kubectl delete -f /home/ec2-user/store_app/deployments/applications/
```

Delete network services!

```bash
kubectl delete -f /home/ec2-user/store_app/deployments/services/
```

### Rebalance pods

#### main

```bash
kubectl scale deployment storefront --replicas=2
```

#### colors unicors

We know Pink and Purple unicorns are coming.

abstract command [COLOUR] = blue | green | red + pink | purple

```bash
kubectl scale deployment storefront-[COLOUR] --replicas=2
```

```bash
kubectl scale deployment storefront --replicas=2
kubectl scale deployment storefront-blue --replicas=2
kubectl scale deployment storefront-green --replicas=2
kubectl scale deployment storefront-red --replicas=2
kubectl scale deployment storefront-pink --replicas=2
kubectl scale deployment storefront-purple --replicas=2
```

```bash
kubectl scale deployment storefront --replicas=3
kubectl scale deployment storefront-blue --replicas=3
kubectl scale deployment storefront-green --replicas=3
kubectl scale deployment storefront-red --replicas=3
kubectl scale deployment storefront-pink --replicas=3
kubectl scale deployment storefront-purple --replicas=3
```

The --replicas= value can be set to anything you like. 1 billion anyone?

### Cluster/Node Update - eksctl Commands MIGHT NOT USE - UKNOWN

```bash
eksctl create cluster -f /home/ec2-user/store_cluster_config.yaml
```

```bash
eksctl create nodegroup -f /home/ec2-user/store_cluster_config.yaml
```

## Challenges

```bash
sed 's|blue|pink|g' storefront-deployment-blue.yaml > storefront-deployment-pink.yaml
sed 's|blue|purple|g' storefront-deployment-blue.yaml > storefront-deployment-purple.yaml
````

```bash
sed 's|blue|pink|g' storefront-network-blue.yaml > storefront-network-pink.yaml
sed 's|blue|purple|g' storefront-network-blue.yaml > storefront-network-purple.yaml
````
