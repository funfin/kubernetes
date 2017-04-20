### updated by puppet
# we just remove all configuration from here
###
# kubernetes system config
#
# The following values are used to configure various aspects of all
# kubernetes services, including
#
#   kube-apiserver.service
#   kube-controller-manager.service
#   kube-scheduler.service
#   kubelet.service
#   kube-proxy.service
# logging to stderr means we get it in the systemd journal
KUBE_LOGTOSTDERR=""

# journal message level, 0 is debug
KUBE_LOG_LEVEL=""

# Should this cluster be allowed to run privileged docker containers
KUBE_ALLOW_PRIV=""

# How the controller-manager, scheduler, and proxy find the apiserver
KUBE_MASTER=""