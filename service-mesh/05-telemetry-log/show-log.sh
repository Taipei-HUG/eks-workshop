#!/bin/sh

kubectl logs -f -n istio-system -l istio-mixer-type=telemetry -c mixer | grep '"user":"jason"'
