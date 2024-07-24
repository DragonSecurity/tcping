
# TCPING

[![Go Report Card](https://goreportcard.com/badge/github.com/dragonsecurity/tcping)](https://goreportcard.com/report/github.com/dragonsecurity/tcping)
[![CodeFactor](https://www.codefactor.io/repository/github/pouriyajamshidi/tcping/badge)](https://www.codefactor.io/repository/github/dragonsecurity/tcping)
[![Go](https://github.com/pouriyajamshidi/tcping/actions/workflows/.github/workflows/codeql-analysis.yml/badge.svg)](https://github.com/dragonsecurity/tcping/actions/workflows/go.yml)
[![Docker container build](https://github.com/pouriyajamshidi/tcping/actions/workflows/container-publish.yml/badge.svg)](https://github.com/dragonsecurity/tcping/actions/workflows/container-publish.yml)
![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/pouriyajamshidi/tcping)
[![Go project version](https://badge.fury.io/go/github.com%dragonsecurity%2Ftcping.svg)](https://badge.fury.io/go/github.com%2Fpouriyajamshidi%2Ftcping)
![Download](https://img.shields.io/github/downloads/dragonsecurity/tcping/total.svg?label=DOWNLOADS&logo=github)

A cross-platform ping program for `TCP` ports inspired by the Linux's ping utility. This program will send `TCP` probes to an `IP address` or a `hostname` specified by you and prints the results. It supports both `IPv4` and `IPv6`.

**TCPING** uses different `TCP sequence numbering` for _successful_ and _unsuccessful_ probes, so that when you look at the results and spot a failed probe, inferring the total packet drops to that point would be easy.

Here are some of the features of **TCPING**:

- An alternative to `ping` in environments that `ICMP` is blocked.
- Monitor your network connection.
- Determine packet loss.
- Analyze the network's latency.
- Calculate `minimum`, `average` and `maximum` latency of network probes.
- Print connection statistics by pressing the `Enter` key, without stopping the program.
- Retry hostname resolution after a predetermined number of probe failures by using the `-r` flag . Suitable to test your `DNS` load balancing or Global Server Load Balancer `(GSLB)`.
- Enforce using `IPv4` or `IPv6`.
- Display the longest encountered `downtime` and `uptime` duration and time.
- Monitor and audit your peers network (SLA).
- Calculate the total uptime or downtime of your network when conducting a maintenance.

---
