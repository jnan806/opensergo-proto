#!/bin/sh
##!/usr/bin/env bash
# ======================================================================
# Linux/OSX startup script
# ======================================================================


function usage() {
  echo "Usage:  gen.sh [-Operator] [Language]"
  echo ""
  echo "Available Operators:"
  echo "  -g, -gen, -generate: generate stub code"
  echo "  -c, -clean         : clean stub code"
  echo ""
  echo "Available Lanuages:"
  echo "  all  : generate stub code of all supported language"
  echo "  go   : generate stub code of go"
  echo "  java : generate stub code of java"
}


operator="$1"
targetLanguage="$2"


cd $(dirname $0)
DIR_HOME="${PWD}"


export PATH=$DIR_HOME/protoc-gen/lib/exec:$PATH
export PATH=$DIR_HOME/protoc-gen/lib/buf/bin:$PATH
export PATH=$DIR_HOME/protoc-gen/lib/protoc/bin:$PATH


# init proto-dir
function init_proto() {
    rm -rf $DIR_HOME/proto/buf.gen.yaml
}

# clean go
function clean_go() {
  rm -rf $DIR_HOME/stub-go/opensergo-protocol-grpc-go
}

# generate go
function gen_go() {
  init_proto
  clean_go
  cp $DIR_HOME/proto/buf.gen.go.yaml $DIR_HOME/proto/buf.gen.yaml
  cd $DIR_HOME/proto
  buf generate
  cp $DIR_HOME/stub-go/go.mod $DIR_HOME/stub-go/opensergo-protocol-grpc-go/go.mod
  cp $DIR_HOME/stub-go/.gitignore $DIR_HOME/stub-go/opensergo-protocol-grpc-go/.gitignore
  cp -r $DIR_HOME/proto/opensergo $DIR_HOME/stub-go/opensergo-protocol-grpc-go/protofile
  init_proto
  cd $DIR_HOME
}

# clean java
function clean_java() {
  rm -rf $DIR_HOME/stub-java/opensergo-protocol-grpc-java
}

# generate java
function gen_java() {
  init_proto
  clean_java
  cp $DIR_HOME/proto/buf.gen.java.yaml $DIR_HOME/proto/buf.gen.yaml
  cd $DIR_HOME/proto
  buf generate
  cp $DIR_HOME/stub-java/pom.xml $DIR_HOME/stub-java/opensergo-protocol-grpc-java/pom.xml
  cp -r $DIR_HOME/proto/opensergo $DIR_HOME/stub-java/opensergo-protocol-grpc-java/src/main/protofile
  init_proto
  cd $DIR_HOME
}

# do_gen
function do_gen() {
  case $targetLanguage in
    "go")
      gen_go
      ;;
    "java")
      gen_java
      ;;
    "all")
      gen_go
      gen_java
      ;;
    *)
      echo "error! unsupport Language..."
      echo ""
      usage
      ;;
  esac
}

# do_clean
function do_clean() {
  case $targetLanguage in
    "all")
      clean_go
      clean_java
      ;;
    "go")
      clean_go
      ;;
    "java")
      clean_java
      ;;
    *)
      echo "error! unsupported Language..."
      echo ""
      usage
      ;;
  esac
}

# main
case $operator in
  "-g" | "-gen" | "generate")
    do_gen
    ;;
  "-c" | "-clean")
    do_clean
    ;;
  *)
    echo "error! unsupported operator..."
    echo ""
    usage
    ;;
esac