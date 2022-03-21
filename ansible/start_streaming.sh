#!/bin/bash

raspivid -t 0  {{ raspicam_args }} -o - | cvlc stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:3333}' :demux=h264
