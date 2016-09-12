#!/bin/bash
JAVA_VERSION=$(java -version 2>&1 | grep version | cut -d'"' -f2 | cut -d '"' -f1)
echo "java_ver=$JAVA_VERSION"
