###
# kubernetes system config
#
# The following values are used to configure the kube-apiserver
#

# The address on the local server to listen to.
KUBE_API_ADDRESS="--insecure-bind-address=0.0.0.0"

# The port on the local server to listen on.
KUBE_API_PORT="--insecure-port=8080"

# Address range to use for services
KUBE_SERVICE_ADDRESSES="--service-cluster-ip-range=10.1.0.0/16"

# default admission control policies
KUBE_ADMISSION_CONTROL="--admission-control=NamespaceLifecycle,NamespaceExists,LimitRanger,SecurityContextDeny,ServiceAccount,ResourceQuota"

KUBE_API_ARGS=" --apiserver-count=2 --authorization-mode=AlwaysAllow --bind-address=0.0.0.0 --cert-dir=/var/run/kubernetes --client-ca-file=/etc/kubernetes/ssl/ca.pem --delete-collection-workers=1 --etcd-prefix=/cluster.local/network --etcd-servers={{ ETCD_LB }} --event-ttl=1h0m0s --ir-data-source=influxdb --ir-dbname=k8s --ir-influxdb-host=localhost:8080/api/v1/proxy/namespaces/kube-system/services/monitoring-influxdb:api --ir-password=root --ir-percentile=90 --ir-user=root --kubelet-https=true --kubelet-timeout=5s --kubernetes-service-node-port=0 --log-flush-frequency=5s --logtostderr=true --long-running-request-regexp=(/|^)((watch|proxy)(/|$)|(logs?|portforward|exec|attach)/?$) --master-service-namespace=default --max-connection-bytes-per-sec=0 --max-requests-inflight=400 --min-request-timeout=1800 --oidc-username-claim=sub --profiling=true --repair-malformed-updates=true --runtime-config= --runtime-config=v1,extensions/v1beta1=true --secure-port=6443 --service-account-key-file=/etc/kubernetes/ssl/apiserver-key.pem --stderrthreshold=2 --storage-versions=authorization.k8s.io/v1beta1,autoscaling/v1,batch/v1,componentconfig/v1alpha1,extensions/v1beta1,metrics/v1alpha1,v1 --tls-cert-file=/etc/kubernetes/ssl/apiserver.pem --tls-private-key-file=/etc/kubernetes/ssl/apiserver-key.pem --v=0 --watch-cache=true --allow-privileged=true"