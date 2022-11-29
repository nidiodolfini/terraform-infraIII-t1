#!/bin/bash
for i in {1..10000}; do
  curl 0.0.0.0
  sleep $1
done
