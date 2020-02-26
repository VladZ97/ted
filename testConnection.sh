#!/bin/bash
while ! wget teds:9191; do sleep 1 
done
curl teds:9191