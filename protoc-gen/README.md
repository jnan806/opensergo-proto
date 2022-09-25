# protoc-gen 环境设置  

![alt gen-stub 目录](docs/images/gen-stub-lib.png)    

- `buf.build` 环境设置:  
  方案一: 本地安装 `buf.build` 参照官网 https://docs.buf.build/installation  
  方案二: `protoc-gen/plugins/buf-1.8.0`目录下选择操作系统对应的安装包，解压放到`lib目录`下,并且重命名为`buf`,如上图  
- `protoc` 环境设置:  
  方案一: 本地安装 `protoc` https://github.com/protocolbuffers/protobuf/releases  
  方案二: `protoc-gen/plugins/protoc-21.6`目录下选择操作系统对应的安装包，解压放到`lib目录`下,并且重命名为`protoc`,如上图  
- `envoyproxy.validate` 环境设置:  
  方案一: 本地安装 `envoyproxy.validate` 参考官网 https://github.com/envoyproxy/protoc-gen-validate  
  ``` go
    # fetches this repo into $GOPATH
    go get -d github.com/envoyproxy/protoc-gen-validate
    # installs PGV into $GOPATH/bin
    make build
  ```
  方案二: Darwin(MacOS系统)将`protoc-gen/plugins/envoyproxy.validate-0.6.8`下我已编译好的文件,移动至`lib/exec目录`下,并且重命名为`protoc-gen-validate`,如上图  
- `protoc-gen-*` grpc 生成环境配置:  
  情况一: 如果采用`proto/buf.gen.go.yaml`等是以`buf.gen.remote-template.yaml`为模板进行配置，则略过此步骤  
  情况二: 如果采用`proto/buf.gen.go.yaml`等是以`buf.gen.local-template.yaml`为模板进行配置，则需要根据每种语言`protoc-gen-*`安装规则进行安装,  
  且需要将安装好的插件以`protoc-gen-`开头,因为`buf.build`本地调用时, 插件的识别规则为`protoc-gen-`+`name`  
  ![img.png](docs/images/buf.build-local-template.png)
- `protoc 各个语言插件`，需要执行安装 protoc 生成目标语言stub-code的相关插件，并且配置到环境变量 `PATH`  
  go对应插件: `protoc-gen-go`、`protoc-gen-go-grpc`  
  java插件 : `protoc-gen-grpc-java`  