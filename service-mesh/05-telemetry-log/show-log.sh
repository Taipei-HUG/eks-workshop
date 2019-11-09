#!/bin/sh

kubectl logs -n istio-system -l istio-mixer-type=telemetry -c mixer | grep '"user":"jason"'
