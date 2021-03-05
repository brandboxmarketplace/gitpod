#!/bin/sh

PROTOC_INCLUDE="-I. -I ./third_party -I /usr/lib/protoc/include"

go get github.com/golang/protobuf/protoc-gen-go
go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
protoc $PROTOC_INCLUDE --go_out=plugins=grpc:go *.proto
protoc $PROTOC_INCLUDE --grpc-gateway_out=logtostderr=true,paths=source_relative:go *.proto
