apiVersion: v1
kind: ReplicationController
metadata:
  name: kube-dns
  namespace: kube-system
  labels:
    k8s-app: kube-dns
    version: v11
    kubernetes.io/cluster-service: "true"
spec:
  replicas: 2
  selector:
    k8s-app: kube-dns
    version: v11
  template:
    metadata:
      labels:
        k8s-app: kube-dns
        version: v11
        kubernetes.io/cluster-service: "true"
    spec:
      containers:
      - name: kube2sky
        image: gcr.io/google_containers/kube2sky:1.14
        resources:
          limits:
            cpu: 200m
            memory: 400Mi
          requests:
            cpu: 200m
            memory: 100Mi
        livenessProbe:
          httpGet:
            path: /healthz
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 60
          timeoutSeconds: 5
          successThreshold: 1
          failureThreshold: 5
        readinessProbe:
          httpGet:
            path: /readiness
            port: 8081
            scheme: HTTP
          initialDelaySeconds: 30
          timeoutSeconds: 5
        args:
        # command = "/kube2sky"
        - --domain=cluster.local
        - --kube-master-url=http://{{ MASTER_LB }}:8080/
        - --etcd-server={{ ETCD_LB }}
      - name: skydns
        image: gcr.io/google_containers/skydns:2015-10-13-8c72f8c
        resources:
          limits:
            cpu: 200m
            memory: 400Mi
          requests:
            cpu: 200m
            memory: 100Mi
        args:
        # command = "/skydns"
        - -machines='{{ ETCD_LB }}'
        - -addr=0.0.0.0:53
        - -ns-rotate=false
        - -domain=cluster.local.
        - -verbose=true
        ports:
        - containerPort: 53
          name: dns
          protocol: UDP
        - containerPort: 53
          name: dns-tcp
          protocol: TCP
      - name: healthz
        image: gcr.io/google_containers/exechealthz:1.0
        resources:
          limits:
            cpu: 20m
            memory: 40Mi
          requests:
            cpu: 20m
            memory: 40Mi
        args:
        - -cmd=nslookup kubernetes.default.svc.cluster.local 127.0.0.1 >/dev/null
        - -port=8080
        ports:
        - containerPort: 8080
          protocol: TCP
      dnsPolicy: Default
