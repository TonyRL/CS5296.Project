# Testing Instruction

## Testing environment

In order to compare the result across different providers, we limit the specification of the cloud machine.

CPU | RAM | Disk | OS
--- | --- | ---  | ---
1 Core | 1GB | 10GB | Ubuntu 18.04.4 LTS

## Setting up the cloud machine

This one line script will install all the prerequisites and set it up properly.

```bash
wget -qO- https://github.com/TonyRL/CS5296.Project/raw/master/Testing/setup.sh | sudo bash
```

## Test theoretical performance

We will run sysbench on CPU, RAM and disk and save the results to /tmp/

```bash
wget -qO- https://github.com/TonyRL/CS5296.Project/raw/master/Testing/test.sh | sudo bash
```

## Test web performance

We use ApacheBench to test the web performance.

```bash
sudo apt install -y apache2-utils
ab -k -c 100 -n 10000 ip-of-cloud-machine/helloworld.html
```

## Setting up wordpress

Visit [http://ip-of-cloud-machine/wordpress](http://ip-of-cloud-machine/wordpress)
Key|Value
---|---
Database Name | wordpress
Username | username
Password | password
Database Host | localhost
Table Prefix | wp_
---|---
Language | English
Site Title | CS5296
Username | 5296User
Password | cs5296-Password
Email | cs5296@cs5296.com
Search Engine Visibility | &#x2611; Discourage search eng......

## Test realword application performance

1. Install and activate plugin WPPerformanceTester
2. Start the test from Tools / WP Performance Tester
