# managed by puppet
###
# kubernetes scheduler config
# default config should be adequate

KUBE_SCHEDULER_ARGS=" --address=0.0.0.0 --algorithm-provider=DefaultProvider --kube-api-burst=100 --kube-api-qps=50 --leader-elect=true --leader-elect-lease-duration=15s --leader-elect-renew-deadline=10s --leader-elect-retry-period=2s --log-flush-frequency=5s --logtostderr=true --master=http://{{ MASTER_LB }}:8080/ --port=10251 --profiling=true --scheduler-name=default-scheduler --stderrthreshold=2 --v=0"