# aurora_exporter
Dockerfile for Apache Aurora Exporter for Prometheus reporting. The Dockerfile packages the Aurora exporter from [here](https://github.com/tommyulfsparre/aurora_exporter).

## Build
```
$ docker build -t abaghudana/aurora_exporter:latest .
```

## Aurora Exporter Configuration
```
$ docker run abaghudana/aurora_exporter:latest -h
  -alsologtostderr
    	log to standard error as well as files
  -exporter.aurora-url string
    	URL to an Aurora scheduler or ZooKeeper ensemble (default "http://127.0.0.1:8081")
  -exporter.bypass-leader-redirect
    	When scraping a HTTP scheduler url, don't follow redirects to the leader instance.
  -log_backtrace_at value
    	when logging hits line file:N, emit a stack trace
  -log_dir string
    	If non-empty, write log files in this directory
  -logtostderr
    	log to standard error instead of files
  -stderrthreshold value
    	logs at or above this threshold go to stderr
  -v value
    	log level for V logs
  -vmodule value
    	comma-separated list of pattern=N settings for file-filtered logging
  -web.listen-address string
    	Address to listen on for web interface and telemetry. (default ":9113")
  -web.telemetry-path string
    	Path under which to expose metrics. (default "/metrics")
  -zk.path string
    	zkNode that aurora maintains master election. (default "/aurora/scheduler")
```

## Running Aurora Exporter
```
$ docker run -d abaghudana/aurora_exporter:latest -exporter.aurora-url=zk://<zk_url>:<zk_port> up -d
```
