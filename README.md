# OpenSergo proto & stub-code


- 准备 `stub code` 生成环境, 参考[`protoc-gen`目录中的 README.md](./protoc-gen/README.md)
- 生成`stub code`，执行 `Makefile`文件
  ```shell
    make gen-go     # 生成  go  代码
    make gen-java   # 生成 java 代码
    make gen-all    # 生成 所有  代码
  
    make clean-go   # 清理  go   代码
    make clean-java # 清理 java  代码
    make clean-all  # 清理 所有   代码
  ```
- 发布`stub code`到`中央仓库`  
  stub-java/opensergo-protocol-grpc-java，发布到`maven仓库`(暂无账号)，故需在`opensergo-protocol-grpc-java`目录本地`mvn install -Dmaven.test.skip=true`进行测试  
  stub-go/opensergo-protocol-grpc-go 发布到`github`，地址暂为 [jnan806/opensergo-protocol-grpc-go](https://github.com/jnan806/opensergo-protocol-grpc-go)
- 正式版规划，采用 `github CI`自动进行上述发布步骤




# 示例Demo

项目生成`stub code`主要用于`OpenSergo SDK`基于`gRpc协议`的依赖, 以及 `opensergo-control-plane`

- opensergo-protocol-grpc-java : 用于  opensergo-java-sdk， 如下
    1. opensergo-java-sdk : [jnan806/opensergo-java-sdk 的 stubcode-based 分支](https://github.com/jnan806/opensergo-java-sdk/tree/stubcode-based)  
       注意：在编译 [jnan806/opensergo-java-sdk 的 stubcode-based 分支](https://github.com/jnan806/opensergo-java-sdk/tree/stubcode-based)  时，应先将生成的`stub-java/opensergo-protocol-grpc-java`本地安装`mvn install -Dmaven.test.skip=true`
- opensergo-protocol-grpc-go : 用于 opensergo-go-sdk 与 opensergo-control-plane，如下
    1. opensergo-go-sdk : [jnan806/opensergo-go-sdk 的 stubcode-based 分支](https://github.com/jnan806/opensergo-go-sdk/tree/stubcode-based)
    2. opensergo-control-plane : [jnan806/opensergo-control-plane 的 stubcode-based 分支](https://github.com/jnan806/opensergo-control-plane/tree/stubcode-based)