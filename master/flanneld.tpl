# Flanneld configuration options

# etcd url location.  Point this to the server where etcd runs
FLANNEL_ETCD="{{ ETCD_LB }}"

# etcd config key.  This is the configuration key that flannel queries
# For address range assignment
FLANNEL_ETCD_KEY="/cluster.local/network"

# Any additional options that you want to pass
FLANNEL_OPTIONS=" -alsologtostderr=false -iface=eth0 -ip-masq=false -subnet-dir=/run/flannel/networks -subnet-file=/run/flannel/subnet.env"